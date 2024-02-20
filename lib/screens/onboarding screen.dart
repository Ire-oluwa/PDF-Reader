import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pdf_reader/routes/route_names.dart';
import 'package:pdf_reader/utilities/constants.dart';
import 'package:pdf_reader/utilities/strings.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..repeat(reverse: true);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(
      const Duration(milliseconds: 500),
      () => Timer(const Duration(seconds: 3), () {
        Get.toNamed(RouteName.registration);
        controller?.forward();
      }),
    );
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: controller!,
                builder: (context, child) {
                  return ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.2).animate(controller!),
                    child: Icon(
                      Icons.rotate_left_outlined,
                      size: 60.sp,
                      color: kIconRed,
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              Text(
                Strings.loading,
                style: TextStyle(fontSize: 20.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
