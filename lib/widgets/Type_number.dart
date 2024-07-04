import 'package:flutter/material.dart';

class Text_number extends StatefulWidget {
  final String title;
  final String hintext;
  final double width;
  final double height;
  final TextEditingController numberController;

  const Text_number({
    super.key,
    required this.title,
    required this.hintext,
    required this.width,
    required this.height,
    required this.numberController,
  });

  @override
  State<Text_number> createState() => _Text_numberState();
}

class _Text_numberState extends State<Text_number> {
  String? _validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
         left: widget.width * 0.02,
       right: widget.height * 0.02),
      
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
              width: widget.width,
              height: widget.height,
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
                validator: _validateNumber,
                autocorrect: true,
                cursorColor: Colors.black.withOpacity(0.5),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(width: 8.0),
          ],
        ),
      ),
    );
  }
}
