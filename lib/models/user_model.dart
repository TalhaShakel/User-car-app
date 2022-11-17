import 'package:firebase_database/firebase_database.dart';

class UserModel {
  String? phone;
  String? name;
  String? id;
  String? email;
  bool? block, approved;

  UserModel(
      {this.phone, this.name, this.email, this.id, this.block, this.approved});

  UserModel.fromSnapshot(DataSnapshot snap) {
    phone = (snap.value as dynamic)["phone"];
    name = (snap.value as dynamic)["name"];
    block = (snap.value as dynamic)["block"];
    id = snap.key;
    email = (snap.value as dynamic)["email"];
    approved = (snap.value as dynamic)["aprroved"];
  }
}
