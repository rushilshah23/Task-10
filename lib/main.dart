import 'package:Task7/services/LocalStorage.dart';
import 'package:Task7/views/HomePage.dart';
import 'package:Task7/views/LogInPage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   bool isSignIn ;
//   List userDetails;
//   userDetails = await LocalStorage().getUserDetails();
//   isSignIn = await LocalStorage().getSignIn();
//   print(userDetails);
//   print("sign in status $isSignIn");
//   // if (userDetails != null) {
//   //   isSignIn = true;
//   // } else if (userDetails == null) {
//   //   isSignIn = false;
//   // }

//   runApp(MaterialApp(
//     home: 
//     // isSignIn
//     //     ? LoginPage(userDetails: userDetails,) : 
//         HomePage(),
//     // routes: {
//     //   '/': (context) => HomePage(),
//     // },
//   )
//   );
// }

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  // List userDetails =['',''];
  // bool visited = false;
  List userDetails;
  bool visited;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

   _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
     userDetails = prefs.getStringList('UserDetails')??null;
     visited = prefs.getBool('isSignIn')??false;
    });

    print(userDetails);
    print(visited);
    
    // setState(()async {
    //   userDetails = await LocalStorage().getUserDetails();
    //   visited = await LocalStorage().getSignIn();
    //   print(userDetails);
    //   print(visited);
    // });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      // debugShowCheckedModeBanner: true,
      // home: HomePage(),
      home:
           visited?LoginPage(userDetails: userDetails): 
       HomePage(),
    );
  }
}