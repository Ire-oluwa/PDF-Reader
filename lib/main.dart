import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pdf_reader/routes/app_pages.dart';
import 'package:pdf_reader/routes/route_names.dart';
import 'firebase_options.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      ensureScreenSize: true,
      builder: (_, child)=>
       Breakpoint(
        breakpointData: const BreakpointData(
          minSmallScreenWidth: 600,
          minMediumScreenWidth: 1024,
          minLargeScreenWidth: 1440,
          minXLargeScreenWidth: 1920,
          minMediumHandsetWith: 360,
          minLargeHandsetWith: 400,
          minSmallTabletWidth: 600,
          minLargeTabletWidth: 720,
          minSmallDesktopWidth: 1024,
          minMediumDesktopWidth: 1440,
          minLargeDesktopWidth: 1920,
        ),
        child: GetMaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: RouteName.onboardingScreen,
          getPages: AppPages.pages,
        ),
      ),
    );
  }
}

