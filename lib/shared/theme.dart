import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 24.0;
double defaultRadius = 17.0;

BoxShadow defaultShadow = BoxShadow(
  color: Colors.grey[300]!.withOpacity(0.5),
  offset: Offset(1, 1),
  blurRadius: 5
);

Color primaryColor = Color(0xff5C40CC);
Color blackColor = Color(0xff1F1449);
Color whiteColor = Color(0xffFFFFFF);
Color greyColor = Color(0xff9698A9);
Color greenColor = Color(0xff0EC3AE);
Color redColor = Color(0xffEB70A5);
Color backgroundColor = Color(0xffF2F2F2);
Color inactiveBorderColor = Color(0xffDBD7EC);
Color transparentColor = Colors.transparent;
Color unavailableColor = Color(0xffEBECF1);
Color availableColor = Color(0xffE0D9FF);
MaterialColor primary = MaterialColor(0xff5C40CC, {
  50: primaryColor,
  100: primaryColor,
  200: primaryColor,
  300: primaryColor,
  400: primaryColor,
  500: primaryColor,
  600: primaryColor,
  700: primaryColor,
  800: primaryColor,
  900: primaryColor,
});


TextStyle blackTextStyle = GoogleFonts.poppins(color: blackColor);
TextStyle greyTextStyle = GoogleFonts.poppins(color: greyColor);
TextStyle whiteTextStyle = GoogleFonts.poppins(color: whiteColor);
TextStyle greenTextStyle = GoogleFonts.poppins(color: greenColor);
TextStyle redTextStyle = GoogleFonts.poppins(color: redColor);
TextStyle purpleTextStyle = GoogleFonts.poppins(color: primaryColor);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semibold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extrabold = FontWeight.w800;
FontWeight black = FontWeight.w900;
