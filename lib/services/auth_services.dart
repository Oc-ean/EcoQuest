import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_quest_vr/model/user_model.dart';
import 'package:eco_quest_vr/services/storage_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(currentUser.uid)
        .get();
    print(documentSnapshot);
    return UserModel.fromSnap(documentSnapshot);
  }

  /// singing up users...
  Future<String> signUpUser({
    required String email,
    required String password,
    required String userName,
    required dynamic countryId,
    required Uint8List file,
  }) async {
    String res = 'Some error occurred';
    try {
      if (email.isNotEmpty || password.isNotEmpty || userName.isNotEmpty) {
        /// create user...
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);

        print(userCredential.user!.uid);
        String photoUrl = await StorageService()
            .uploadingImageToStorage('profilePic', file, false);

        /// add user data to database...
        UserModel user = UserModel(
          email: email,
          uid: userCredential.user!.uid,
          userName: userName,
          photoUrl: photoUrl,
          countryId: countryId,
        );

        _firestore.collection('users').doc(userCredential.user!.uid).set(
              user.toJson(),
            );
        res = 'Successful';
      }
    } on FirebaseAuthException catch (error) {
      res = error.toString();
    }
    return res;
  }

  /// login users..
  Future<String> logInUsers(
      {required String email, required String password}) async {
    String res = 'Some error';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'successful';
      } else {
        res = 'Please enter all the fields';
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }
}
