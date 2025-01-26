
import 'package:evently/core/widgets/custom_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class FirebaseServices {
  static Future<bool> signUp(String email, String password,BuildContext context) async {
    EasyLoading.show();
    try{
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return Future.value(true);
    }on FirebaseAuthException catch(e){
      if(e.code  == "week-password"){
        print('the password provided is too weak.');
      }else if(e.code == "email-already-in-use"){
        print('the account is already exists for that email');
      }
      return Future.value(false);
    }catch(e){
      ShowSnackBar(e.toString(), context);
      return Future.value(false);
    }
  }

  static Future<bool> signIn(String email, String password,BuildContext context) async {
    EasyLoading.show();
    try{
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      //log("User signed in: ${userCredential.user!.uid}"); // Log the user's UID
      return Future.value(true);
    }on FirebaseAuthException catch(e){
      if(e.code  == "week-password"){
        print('the password provided is too weak.');
      }else if(e.code == "email-already-in-use"){
        print('the account is already exists for that email');
      }
      return Future.value(false);
    }catch(e){
      ShowSnackBar(e.toString(), context);
      return Future.value(false);
    }
  }

  static Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
