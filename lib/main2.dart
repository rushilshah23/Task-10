import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FetchData(),
    );
  }
}

class FetchData extends StatefulWidget {
  @override
  _FetchDataState createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  String id, name, mobile, age;
  TextEditingController controllerId = new TextEditingController();
  final _formkey = GlobalKey<FormState>();

  void fetchData() {
    if (_formkey.currentState.validate()) {
      id = controllerId.text;

      FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
      DatabaseReference databaseReference = firebaseDatabase.reference().child('users').child(id);
      databaseReference.once().then((DataSnapshot dataSnapshot) {
        setState(() {
          name = dataSnapshot.value['name'];
          mobile = dataSnapshot.value['mobile'];
          age = dataSnapshot.value['age'];
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the FetchData object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Fetch Data Page"),
      ),
      body: Center(
        child: Container(
            padding: EdgeInsets.all(15),
            child: Form(
              key: _formkey,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controllerId,
                    decoration: InputDecoration(
                      hintText: "Enter Id",
                      border: new OutlineInputBorder(),
                    ),
                    validator: (String input) {
                      if (input.isEmpty) {
                        return "Id cannot be empty";
                      } else
                        return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    onPressed: () {
                      fetchData();
                    },
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Fetch data",
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Your name=$name",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Your phone no=$mobile",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Your age=$age",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddData()),
                      );
                    },
                    padding: EdgeInsets.all(15),
                    child: Text("Add new data"),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  final _formKey = GlobalKey<FormState>();
  String id, name, mobile, age;
  TextEditingController controllerId = new TextEditingController();
  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerMobile = new TextEditingController();
  TextEditingController controllerAge = new TextEditingController();

  void addData() {
    if (_formKey.currentState.validate()) {
      id = controllerId.text;
      name = controllerName.text;
      mobile = controllerMobile.text;
      age = controllerAge.text;

      FirebaseDatabase firebaseDatabase = FirebaseDatabase.instance;
      DatabaseReference databaseReference = firebaseDatabase.reference();
      databaseReference
          .child("users")
          .child(id)
          .set({'name': name, 'mobile': mobile, 'age': age});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the AddData object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Add data page"),
      ),
      body: Center(
        child: Container(
            padding: EdgeInsets.all(15),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controllerId,
                    decoration: InputDecoration(
                      hintText: "Enter Id",
                      border: new OutlineInputBorder(),
                    ),
                    validator: (String input) {
                      if (input.isEmpty) {
                        return "Id cannot be empty";
                      } else
                        return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: controllerName,
                    decoration: InputDecoration(
                      hintText: "Enter name",
                      border: new OutlineInputBorder(),
                    ),
                    validator: (String input) {
                      if (input.isEmpty) {
                        return "name cannot be empty";
                      } else
                        return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: controllerMobile,
                    decoration: InputDecoration(
                      hintText: "Enter contact no",
                      border: new OutlineInputBorder(),
                    ),
                    validator: (String input) {
                      if (input.isEmpty) {
                        return "contact cannot be empty";
                      } else
                        return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: controllerAge,
                    decoration: InputDecoration(
                      hintText: "Enter age",
                      border: new OutlineInputBorder(),
                    ),
                    validator: (String input) {
                      if (input.isEmpty) {
                        return "age cannot be empty";
                      } else
                        return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RaisedButton(
                    onPressed: () {
                      addData();
                    },
                    padding: EdgeInsets.all(15),
                    child: Text("Add data"),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
