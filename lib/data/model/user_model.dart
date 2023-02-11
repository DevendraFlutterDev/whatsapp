import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required String name,
    required String email,
    required String phoneNumber,
    required bool isOnline,
     String? uid,
    required String status,
    required String profileUrl,
  }) : super(
          name: name,
          email: email,
          phoneNumber: phoneNumber,
          isOnline: isOnline,
          uid: uid,
          status: status,
          profileUrl: profileUrl,
        );

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      name: snapshot.get('name'),
      email: snapshot.get('email'),
      phoneNumber: snapshot.get('phoneNumber'),
      uid: snapshot.get('uid'),
      isOnline: snapshot.get('isOnline'),
      profileUrl: snapshot.get('profileUrl'),
      status: snapshot.get('status'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "uid": uid,
      "isOnline": isOnline,
      "profileUrl": profileUrl,
      "status": status,
    };
  }
}
