import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const CustomTextFormField({
    required this.title,
    required this.hintText,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontWeight: regular,
            ),
          ),
          SizedBox(height: 8),
          TextFormField(
            obscureText: obscureText,
            cursorColor: blackColor,
            controller: controller,
            keyboardType: keyboardType,
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: regular,
            ),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15),
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
                borderSide: BorderSide(color: primaryColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
