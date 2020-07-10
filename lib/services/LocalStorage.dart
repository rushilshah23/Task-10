import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  SharedPreferences prefs;

  Future<void> saveLogInDetails(List logInDetails) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('LogInDetails', logInDetails);
  }

  Future<List> getLogInDetails() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('LogInDetails');
  }

  Future<void> saveUserDetails(List userDetails) async {
    prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('UserDetails', userDetails);
  }

  Future<List> getUserDetails() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('UserDetails');
  }

  Future<void> saveSignIn(bool isSignIn) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool('isSignIn', isSignIn);
  }

  Future<bool> getSignIn() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isSignIn');
  }
}
