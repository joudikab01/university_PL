import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:uni_project/providers/products_manager.dart';

import 'google_sign_in.dart' as go;

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<String?> signInWithGoogle(BuildContext context) async {
    try {
      print('not signed');
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      print(' signed');
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      print('authenticated');
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      print('credentials');
      await _auth.signInWithCredential(credential);
      print('token is ${await _auth.currentUser?.getIdToken()}');
      log('access is ${googleSignInAuthentication.accessToken}');
      var sign = await Provider.of<ProductsManager>(context, listen: false)
          .signUpWithGoogle(googleSignInAuthentication.accessToken ?? "",
              await _auth.currentUser?.getIdToken() ?? "");
    } catch (e) {
      print("error is ${e.toString()}");
    }
    return _auth.currentUser?.getIdToken();
  }

  Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
