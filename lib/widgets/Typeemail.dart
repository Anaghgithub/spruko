import 'package:flutter/material.dart';

class Typeemail extends StatefulWidget {
  final String title;
  final String hintext;
  final double width;
  final double height;
  final TextEditingController emailController;

  const Typeemail({
    super.key,
    required this.title,
    required this.hintext,
    required this.width,
    required this.height,
    required this.emailController,
  });

  @override
  _TypeemailState createState() => _TypeemailState();
}

class _TypeemailState extends State<Typeemail> {
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      var title = widget.title;
      return 'Please enter your ${title.toLowerCase()}';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]{2,}")
        .hasMatch(value)) {
      return 'Please enter a valid ${widget.title.toLowerCase()} address';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double responsiveWidth = screenWidth < 450
        ? screenWidth * 0.9
        : screenWidth < 820
            ? widget.width
            : screenWidth * 0.9;
    double responsiveHeight =
        screenWidth < 600 ? widget.height * 1.2 : widget.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
      ),
      child: Container(
        width: responsiveWidth,
        height: responsiveHeight,
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
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: widget.emailController,
                    decoration: InputDecoration(
                      hintText: widget.hintext,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.3)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.3)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.black.withOpacity(0.3)),
                      ),
                    ),
                    validator: _validateEmail,
                    autocorrect: false,
                    cursorColor: Colors.black,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
