import 'package:flutter/material.dart';
import 'package:smart_track/core/constants/app_color_constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final double width;
  final double height;
  final String labelText;
  final bool isPassword;
  final bool isVisible;
  final bool isEnabled;
  final Function suffixIconFunction;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.width,
      required this.height,
      required this.labelText,
      required this.isPassword,
      required this.isVisible,
      required this.isEnabled, required this.suffixIconFunction});

  @override
  Widget build(BuildContext context) {
    return Container(alignment: Alignment.center,
      decoration: BoxDecoration(color: AppColorsConstants.purpleLt,borderRadius: BorderRadius.circular(12)),
      width: width,
      height: height,
      child: Padding(
        padding:  EdgeInsets.all(height*0.1),
        child: TextField(obscureText: !isVisible,
          controller: controller,
          enabled: isEnabled,
          decoration: InputDecoration(border: const OutlineInputBorder(borderSide: BorderSide.none),
              labelText: labelText,
              suffixIcon:  isPassword
                      ? GestureDetector(
                onTap: (){suffixIconFunction();},
                        child: isVisible?const Icon(Icons.remove_red_eye)
                        : const Icon(Icons.remove_red_eye_outlined),
                      ):null
                 ),
        ),
      ),
    );
  }
}
