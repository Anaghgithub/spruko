import 'package:flutter/material.dart';

class Button2 extends StatelessWidget {
  final Color color;
  final String text;
  final TextStyle style;
  final double height;
  final double width;

  const Button2({
    Key? key,
    required this.color,
    required this.text,
    required this.style,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5), 
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}
