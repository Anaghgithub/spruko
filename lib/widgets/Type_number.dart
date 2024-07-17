import 'package:flutter/material.dart';

class Text_number extends StatefulWidget {
  final String title;
  final String hintext;
  final double width;
  final double height;
  final TextEditingController numberController;

  const Text_number({
    Key? key,
    required this.title,
    required this.hintext,
    required this.width,
    required this.height,
    required this.numberController,
  }) : super(key: key);

  @override
  State<Text_number> createState() => _Text_numberState();
}

class _Text_numberState extends State<Text_number> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double responsiveWidth;
    if (screenWidth < 450) {
      responsiveWidth = screenWidth * 0.9; // for phones
    } else if (screenWidth < 820) {
      responsiveWidth = widget.width; // for smaller tablets
    } else {
      responsiveWidth = screenWidth * 0.9; // for larger tablets
    }

    double responsiveHeight = screenWidth < 450 ? screenHeight * 0.1 : widget.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
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
                controller: widget.numberController,
                decoration: InputDecoration(
                  hintText: widget.hintext,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
                autocorrect: true,
                cursorColor: Colors.black.withOpacity(0.5),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
