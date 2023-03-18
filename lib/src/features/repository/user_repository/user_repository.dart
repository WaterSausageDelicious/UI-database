import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uidb/src/features/authentication/model/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson()).whenComplete(() => Get.snackbar(
              "Success",
              "Your Account Has Been Created",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.blue.withOpacity(0.1),
              colorText: Colors.cyan),
        )
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong,try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }

    Future<UserModel> getUserDetails (String email) async {
       final snapshot = await _db.collection("Users").where("Email", isEqualTo: email).get();
       final userData = snapshot.docs.map((e) => UserModel.fromDocumentsnapshot(e)).single;
       return userData;
    }

    Future<List<UserModel>> allUser () async {
      final snapshot = await _db.collection("Users").get();
      final userData = snapshot.docs.map((e) =>
          UserModel.fromDocumentsnapshot(e)).toList();
      return userData;
    }
  }



