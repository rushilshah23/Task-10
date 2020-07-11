import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:Task7/widgets/appbars.dart';
import 'package:Task7/widgets/buttons.dart';
import 'package:flutter/services.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:firebase/firebase.dart';
// import 'package:Task7/services/FireBaseService.dart';

class EditProfile extends StatefulWidget {
  final age;
  final name;
  EditProfile({this.name,this.age});
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  FirebaseUser user;
  String uid;
  List<String> userData;

  List<String> spUserData;

  String name, id, age;

  FirebaseAuth _auth = FirebaseAuth.instance;

  final _editProfileFormKey = GlobalKey<FormState>();
  TextEditingController _editNameController;
  TextEditingController _editAgeController = new TextEditingController();

  void initState(){
    super.initState();
    _editNameController = new TextEditingController(text: widget.name??null);
    _editAgeController = new TextEditingController(text:  widget.age??null);




    // getspUserData();
    // if(spUserData!=null){
    //   _editNameController = 
    //   _editNameController = new TextEditingController(text: spUserData[0]??null);
    //   _editAgeController = new TextEditingController(text:  spUserData[1]??null);
    // }else{
    //   _editNameController =  new TextEditingController();
    //   _editAgeController = new TextEditingController();
    // }

  }

  void getspUserData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    spUserData = prefs.getStringList('UserDetails');

  }

  String numberValidator(String value) {
    if (value == null) {
      return null;
    }
    final n = num.tryParse(value);
    if (n == null) {
      return '$value is not a valid number';
    }
    return null;
  }

  void addData() async {
    await _auth.currentUser().then((value) async {
      uid = value.uid;
      if (_editProfileFormKey.currentState.validate()) {
        id = uid;
        name = _editNameController.text;
        // mobile = controllerMobile.text;
        age = _editAgeController.text;

        FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
        DatabaseReference databaseReference = firebaseDatabase.reference();
        databaseReference
            .child("users")
            .child(id)
            .set({'name': name, 'age': age});
        userData = [name, age];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: pageAppBar('Edit Profile'),
        body: Builder(builder: _editProfile));
  }

  Form _editProfile(BuildContext context) {
    return Form(
        key: _editProfileFormKey,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _editNameController,
                validator: (String content) {
  
                    if (content.length == 0) {
                      return 'Please enter your Name';
                    } else {
                      return null;
                    }

                  },
                decoration: InputDecoration(
                    labelText: "Name",
                    hintText: "Enter your Name",
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _editAgeController,
                keyboardType: TextInputType.number,
                validator: numberValidator,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                    labelText: "Age",
                    hintText: "Enter your Age",
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 16,
              ),
              formButton(context,
                  iconData: Icons.edit,
                  textData: 'Save Changes', onPressed: () async {
                if (_editProfileFormKey.currentState.validate()) {
                  addData();
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setStringList('UserData', userData);
                  Navigator.pop(context,
                  // userData!=null??
                  'Details Saved'
                  // (){
                  //   setState(() {
                  //     // Scaffold.of(context).showSnackBar(SnackBar(content: Text("Details Saved")));
                  //   });
                  // }
                  );
                }else{
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text("Something went wrong")));
                }
              })
            ],
          ),
        ));
  }
}
