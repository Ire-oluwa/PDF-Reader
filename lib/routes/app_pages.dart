import 'package:get/get_navigation/get_navigation.dart';
import 'package:pdf_reader/routes/route_names.dart';
import 'package:pdf_reader/screens/registration.dart';

class AppPages {
  static final pages = [
    GetPage(name: RouteName.registration, page: ()=> const RegistrationScreen()),
  ];
}