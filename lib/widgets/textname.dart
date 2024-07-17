import 'package:flutter/material.dart';

class Textname extends StatelessWidget {
  final String title;
  final String hintext;
  final double width;
  final double height;
  final TextEditingController nameController;

  const Textname({
    super.key,
    required this.title,
    required this.hintext,
    required this.width,
    required this.height,
    required this.nameController,
  });

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    final nameRegex = RegExp(r'^[A-Z][a-zA-Z\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'Enter a valid name with the first letter capitalized';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double responsiveWidth;
    if (screenWidth < 450) {
      responsiveWidth = screenWidth * 0.9; // for phones
    } else if (screenWidth < 820) {
      responsiveWidth = width; // for smaller tablets
    } else {
      responsiveWidth = screenWidth * 0.9; // for larger tablets
    }

    double responsiveHeight = screenWidth < 450 ? screenHeight * 0.1 : height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            width: responsiveWidth,
            height: responsiveHeight,
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: hintext,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
                ),
              ),
              validator: _validateName,
              autocorrect: true,
              cursorColor: Colors.black.withOpacity(0.5),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
