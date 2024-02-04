import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_group_1/app_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseAuthUtil {
  static Future<bool> loginIn({required String email, required String password}) async {
    bool isLoggedIn = false;
    try {
      var userData = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      isLoggedIn = userData.user != null;
      if (isLoggedIn) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(AppSettings.emailSharedPrefsKey, email);
      }
    } catch (e) {
      print(e.toString());
    }
    return isLoggedIn;
  }

  static Future<bool> createAccount({required String email, required String password}) async {
    bool isSignUp = false;
    try {
      var userData = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      isSignUp = userData.user != null;
      if (isSignUp) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(AppSettings.emailSharedPrefsKey, email);
      }
    } catch (e) {
      print(e.toString());
    }
    return isSignUp;
  }
}
