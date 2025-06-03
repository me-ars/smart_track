import 'package:flutter/material.dart';
import 'package:smart_track/core/constants/app_color_constants.dart';

class Button extends StatelessWidget {
  final double height;
  final double width;
  final Function onTap;
  final String buttonText;

  const Button(
      {super.key,
      required this.height,
      required this.width,
      required this.onTap,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: AppColorsConstants.purple, borderRadius: BorderRadius.circular(10)),
          child:  Center(
            child: Text(
              buttonText,
              style: const  TextStyle(color: AppColorsConstants.white),
            ),
          ),
        ));
  }
}
