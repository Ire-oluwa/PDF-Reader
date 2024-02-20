import 'package:get/get_navigation/get_navigation.dart';
import 'package:pdf_reader/routes/route_names.dart';
import 'package:pdf_reader/screens/login.dart';
import 'package:pdf_reader/screens/onboarding%20screen.dart';
import 'package:pdf_reader/screens/pdf_list_screen.dart';
import 'package:pdf_reader/screens/registration.dart';

class AppPages {
  static final pages = [
    GetPage(name: RouteName.registration, page: ()=> const RegistrationScreen()),
    GetPage(name: RouteName.pdfListScreen, page: ()=> const PDFListScreen()),
    GetPage(name: RouteName.onboardingScreen, page: ()=> const OnboardingScreen()),
    GetPage(name: RouteName.login, page: ()=> const LoginScreen()),
  ];
}