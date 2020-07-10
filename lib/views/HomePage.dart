import 'package:Task7/services/LocalStorage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Task7/widgets/appbars.dart';
import 'package:Task7/widgets/buttons.dart';
import 'package:Task7/views/LogInPage.dart';
import 'package:Task7/views/RegisterPage.dart';
import 'package:Task7/views/ResetPassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Task7/widgets/signInButton.dart';
import 'package:Task7/services/FireBaseService.dart';
import 'package:Task7/widgets/snackbars.dart';
import 'package:Task7/views/WidgetHome.dart';


class HomePage extends StatefulWidget {
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  TextEditingController _emailHomePageController = new TextEditingController();
  TextEditingController _passwordHomePageConroller =
      new TextEditingController();
  final _homeFormKey = GlobalKey<FormState>();
  List<String> userDetails;
  List loginDetails;
  FirebaseUser user;

  @override
  initState() {
    super.initState();
    setSignIn();
  }

  Future<void> setSignIn() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool('isSignIn', false);
      prefs.setStringList('UserDetails', null);
    });
    // await LocalStorage().saveSignIn(false);
    // await LocalStorage().saveUserDetails(null);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: pageAppBar("Welcome"),
        body: Builder(
          builder: _homePageForm,
        ));
  }

  Form _homePageForm(BuildContext context) {
    return Form(
        key: _homeFormKey,
        child: ListView(
          padding: EdgeInsets.all(32.0),
          children: <Widget>[
            Center(
              child: Icon(
                Icons.people,
                size: 128,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _emailHomePageController,
              keyboardType: TextInputType.emailAddress,
              validator: (String content) {
                if (content.contains('@')) {
                  if (content.length == 0) {
                    return 'Please enter your Email ID';
                  } else {
                    return null;
                  }
                } else {
                  return 'Please enter a VALID Email ID';
                }
              },
              decoration: InputDecoration(
                  labelText: "Email ID",
                  hintText: "Enter your Email ID",
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: _passwordHomePageConroller,
              obscureText: true,
              validator: (String content) {
                if (content.length < 8) {
                  return 'Minimum 8 DIGIT password';
                } else {
                  return null;
                }
              },
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter Your Password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            formButton(context, iconData: Icons.lock_open, textData: "Log In",
                onPressed: () async {
              if (_homeFormKey.currentState.validate()) {
                try {
                  await signInWithEmail(_emailHomePageController.text,
                          _passwordHomePageConroller.text)
                      .then((value) async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    setState(() {
                      userDetails = value;
                      prefs.setStringList('UserDetails', userDetails);
                    });

                    // loginDetails = await LocalStorage().getLogInDetails();

                    // userDetails = value;

                    print("User details in HomePage are $userDetails");
                    // print(loginDetails);
                    if (userDetails != null) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginPage(
                                    userDetails: userDetails,
                                  )));
                    }
                  });
                } catch (error) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("invalid email or password")));
                }
              }
            }),
            SizedBox(
              height: 16,
            ),
            formButton(context,
                iconData: Icons.supervised_user_circle,
                textData: "New User", onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterPage()),
              );
            }),
            SizedBox(height: 16),
            formButton(context,
                iconData: Icons.visibility_off,
                textData: "Forget Password", onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResetPasswordPage()),
              );
            }),
            SizedBox(height: 16),

            // formButton(context,
            //     iconData: Icons.home,
            //     textData: "Sign in with Google",
            //     onPressed: () {}),
            // SizedBox(height: 16),
            signInButton(() async {
              final prefs = await SharedPreferences.getInstance();
              await handleSignIn().then((value) {
                setState(() {
                  user = value;
                  userDetails = [user.uid, user.email];
                });
                print(userDetails);
                // LocalStorage().saveUserDetails(userDetails);
                prefs.setStringList('UserDetails', userDetails);

                // userDetails = await signInWithGoogle().whenComplete(() {
                print("userDetails are as $userDetails");
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginPage(
                              userDetails: userDetails,
                            )));
              });
            }),
            SizedBox(
              height: 16,
            ),
            formButton(context,
                iconData: Icons.widgets,
                textData: "Widgets", onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WidgetHomePage()),
              );
            })
          ],
        ));
  }
}
