import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf_reader/constants.dart';
import 'package:pdf_reader/view_model/registration.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = RegistrationControl();
    return Scaffold(
      backgroundColor: kPrimaryWhite,
      body: SafeArea(
        child: kUnfocus(
          child:  SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              children: [
                TextField(controller: prov.email,),
                TextField(controller: prov.password,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
