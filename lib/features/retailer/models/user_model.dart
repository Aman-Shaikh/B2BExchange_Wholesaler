import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String? phoneNo;
  final String password;

  const UserModel({
    this.id,
    required this.email,
    required this.password,
    required this.fullName,
    this.phoneNo,
  });

  //firebase does not stores data directly we need to convert data into json format
  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Phone": phoneNo,
      "Password": password
    };
  }

  //fetching model
  // Map user fetched from firebase to userModel
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    final data = document.data()!;//.data provides complete object .get provides particular value e.g. email
        return UserModel(
            id: document.id,
            email: data["Email"],//here "Email" is namne of column in database
            password: data["Password"],
            fullName: data["FullName"],
            phoneNo: data["Phone"]);
  }
}
