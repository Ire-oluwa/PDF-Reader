import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pdf_reader/routes/route_names.dart';
import 'package:pdf_reader/services/firebase_auth.dart';

class EmailLoginControl extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final auth = Auth();
  late final uid;

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }

  void onChanged(String value) {
    log(value);
    update();
  }

  Future<void> onEmailSignIn() async {
    try{
      await auth
          .firebaseSignInWithEmailPassword(email.text, password.text).then((value) {
        log(value!.uid.toString());
        uid = value.uid;
      }).then((value) => Get.toNamed(RouteName.pdfListScreen));
      update();
    } catch(error){
      log(time: DateTime.now().toLocal(), "Error: $error");
    }
  }
}
