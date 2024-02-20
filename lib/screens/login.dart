import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pdf_reader/routes/route_names.dart';
import 'package:pdf_reader/utilities/strings.dart';
import 'package:pdf_reader/view_model/email_login_control.dart';

import 'package:pdf_reader/utilities/constants.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = EmailLoginControl();
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
                            await prov.onEmailSignIn();
                            log(prov.uid);
                          },
                          style:
                          TextButton.styleFrom(backgroundColor: kIconRed),
                          child: const Text(
                            "Email Sign-in",
                            style: TextStyle(color: kPrimaryWhite),
                          )),
                      SizedBox(width: 20.w),
                      TextButton(
                          onPressed: () {},
                          style:
                          TextButton.styleFrom(backgroundColor: kIconRed),
                          child: const Text(
                            "Google Sign-in",
                            style: TextStyle(color: kPrimaryWhite),
                          )),
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
