import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String uid;
  final String photoUrl;
  final String userName;
  final String countryId;
  UserModel({
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.countryId,
    required this.userName,
  });
  Map<String, dynamic> toJson() => {
        'email': email,
        'uid': uid,
        'photoUrl': photoUrl,
        'username': userName,
        'countryId': countryId,
      };
  static UserModel fromSnap(DocumentSnapshot snapshot) {
    var documentSnapShot = snapshot.data() as Map<String, dynamic>;
    print('==========>$documentSnapShot<========');
    return UserModel(
      email: documentSnapShot['email'],
      uid: documentSnapShot['uid'],
      photoUrl: documentSnapShot['photoUrl'],
      userName: documentSnapShot['username'],
      countryId: documentSnapShot['countryId'],
    );
  }
}
