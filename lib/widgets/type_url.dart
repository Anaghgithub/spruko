import 'package:flutter/material.dart';

class TypeUrl extends StatelessWidget {
  final String title;
  final String hintext;
  final double width;
  final double height;
  final TextEditingController urlController;

  TypeUrl({
    Key? key,
    required this.title,
    required this.hintext,
    required this.width,
    required this.height,
    required this.urlController,
  }) : super(key: key);

  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field is required';
    }
    
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding:  EdgeInsets.only(
       left: screenWidth * 0.02,
        right: screenHeight * 0.02,
      ),
      child: Container(
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
              width: width,
              height: height,
              child: TextFormField(
                controller: urlController,
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
      ),
    );
  }
}
