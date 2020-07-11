import 'package:Task7/services/LocalStorage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Task7/views/HomePage.dart';
import 'package:Task7/widgets/appbars.dart';
import 'package:Task7/widgets/buttons.dart';
import 'package:Task7/widgets/texttiles.dart';
import 'package:Task7/services/FireBaseService.dart';
import 'package:Task7/views/EditProfile.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:Task7/services/SnackbarPop.dart';

class LoginPage extends StatefulWidget {
  final List userDetails;
  LoginPage({this.userDetails}):assert(userDetails!=null);
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  List<String> userDetails, userData;
  FirebaseUser user;
  String uid;

  @override
  initState() {
    super.initState();

    setUserDetails();
    setSignIn();
    getUserData();
    fetchData();
  }

  void setUserDetails(){
    setState(() {
      userDetails = widget.userDetails;
    });
  }

  String id, name, mobile, age;
  FirebaseAuth _auth = FirebaseAuth.instance;

  void fetchData() async {
    user = await _auth.currentUser();
    id = user.uid;

    FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
    DatabaseReference databaseReference =
        firebaseDatabase.reference().child('users').child(id);
    databaseReference.once().then((DataSnapshot dataSnapshot) {
      setState(() {
        name = dataSnapshot.value['name'];
        // mobile = dataSnapshot.value['mobile'];
        age = dataSnapshot.value['age'];
      });
    });
  }

  void setSignIn() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool('isSignIn', true);
      prefs.setStringList('UserDetails', widget.userDetails);
    });
  }

  void getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userData = prefs.getStringList('UserData') ?? null;
    });

    if (userData == null) {
      setState(() {
        userData = ['your name', 'your age'];
      });
    }
  }

  // void getLoginDetails() async {
  //   setState(() async {
  //     loginDetails = await LocalStorage().getLogInDetails();
  //   });
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: pageAppBar("User Details"),
      body: Builder(
        builder: _loginPageFormScaffold,
      ),
    );
  }

  Widget _loginPageFormScaffold(BuildContext context) {
    return Center(
      child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: textTile(text1: "UID : ", text2: userDetails[0]
                    // userDetails[0]
                    ),
              ),
              Expanded(
                flex: 1,
                child: textTile(text1: "emailid : ", text2: userDetails[1]
                    // userDetails[1]
                    ),
              ),
              Expanded(
                flex: 1,
                child: textTile(text1: "Name : ", text2: name??'Set user name'
                    // userData[0] ?? 'your name'
                    // userDetails[1]
                    ),
              ),
              Expanded(
                flex: 1,
                child: textTile(text1: "Age : ", text2: age??'Set user age'
                    // userData[1] ?? 'your age'
                    // userDetails[1]
                    ),
              ),
              formButton(context,
                  iconData: Icons.edit,
                  textData: 'Edit Profile', onPressed: () async {
                final result = await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditProfile(name: name,age: age,)))
                    .then((value) {
                  Scaffold.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text(value)));

                  setState(() {
                    fetchData();
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text("Details Saved")));
                  });
                });
                Scaffold.of(context)
                  ..removeCurrentSnackBar()
                  ..showSnackBar(SnackBar(content: Text('$result')));
              }),
              SizedBox(
                height: 16.0,
              ),
              formButton(context, onPressed: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.setBool('isSignIn', false).then((_) {
                  prefs.setStringList('UserDetails', null).then((_) {
                    print(prefs.getStringList('UserDetails'));
                    print("sign in status ${prefs.getBool('isSignIn')}");
                    signOutGoogle();
                    signOutEmail();
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  });
                });
              }, textData: "Log Out", iconData: Icons.track_changes),
            ],
          )),
    );
  }
}
