import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pdf_reader/routes/route_names.dart';
import 'package:pdf_reader/utilities/constants.dart';
import 'package:pdf_reader/services/firebase_auth.dart';
import 'package:pdf_reader/utilities/strings.dart';
import 'package:pdf_reader/view_model/email_registration_control.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = EmailRegistrationControl();
    return Scaffold(
      backgroundColor: kPrimaryWhite,
      body: kUnfocus(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: prov.email,
                    decoration: const InputDecoration(hintText: Strings.email),
                    onChanged: (value) => prov.onChanged(value),
                  ),
                  TextField(
                    controller: prov.password,
                    decoration: const InputDecoration(hintText: Strings.password),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () async {
                            await prov.onEmailSignUp();
                            log(prov.uid);
                          },
                          style:
                              TextButton.styleFrom(backgroundColor: kIconRed),
                          child: const Text(
                            "Email Signup",
                            style: TextStyle(color: kPrimaryWhite),
                          )),
                      SizedBox(width: 20.w),
                      TextButton(
                          onPressed: () {},
                          style:
                              TextButton.styleFrom(backgroundColor: kIconRed),
                          child: const Text(
                            "Google Signup",
                            style: TextStyle(color: kPrimaryWhite),
                          )),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Strings.alreadyAMember,
                        style: TextStyle(fontSize: 16.sp, color: Colors.black),
                      ),
                      TextButton(
                        onPressed: () => Get.toNamed(RouteName.login),
                        child: Text(
                          Strings.login,
                          style: TextStyle(fontSize: 16.sp, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
