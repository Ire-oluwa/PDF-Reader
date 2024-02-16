import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const kPrimaryWhite = Color(0xFFFFFFFF);
const kSecondaryYellow = Color(0xFFFED085);
const kPrimaryYellow = Color(0xFFFFB236);
const kFadedYellow = Color(0xFFFFF1DA);
const kPrimaryBlack = Color(0xFF000000);
const kTransparent = Colors.transparent;
const kArrowIcon = Color(0xFF1D2654);
const kIconRed = Color(0xFFA10035);
const kRed = Color(0xFFFF0000);
const kGrey = Colors.grey;
const kBlurColour = Color(0xFF19392C);
const kOffWhite = Color(0xFFC4C4C4);
final kTextFieldBorder = const Color(0xFF19392C).withOpacity(0.7);
const kTextFieldColour = Color(0xFFF6F8FA);



/// Text Inputs
const kTextInputAction = TextInputAction.next;
//FORMATTERS

final kNameFormatter = [
  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]'))
];
final kTextFormatter = [
  FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9 ]')),
];
final kEmailFormatter = [
  FilteringTextInputFormatter.allow(
    RegExp('[a-zA-Z@0-9._]'),
  ),
];
final kNumberFormatter = [FilteringTextInputFormatter.digitsOnly];
final kPasswordFormatter = [
  FilteringTextInputFormatter.allow(
    RegExp(
      ('[a-zA-Z0-9_|#@!*?+%]'),
    ),
  ),
];

const kNameCapitalization = TextCapitalization.words;
const kEmailKeyboard = TextInputType.emailAddress;
const kNameKeyboard = TextInputType.text;
const kNumberKeyboard = TextInputType.number;
const kPasswordKeyboard = TextInputType.visiblePassword;

//DISMISS KEYBOARD(the highest widget in the tree)
Widget kUnfocus({child}) => GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: child,
    );
