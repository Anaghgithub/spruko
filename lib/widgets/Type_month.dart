import 'package:flutter/material.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class TypeMonth extends StatefulWidget {
  final String title;
  final String hintext;
  final double width;
  final double height;
  final TextEditingController monthController;

  const TypeMonth({
    super.key,
    required this.title,
    required this.hintext,
    required this.width,
    required this.height,
    required this.monthController,
  });

  @override
  _TypeMonthState createState() => _TypeMonthState();
}

class _TypeMonthState extends State<TypeMonth> {
  void _pickMonth(BuildContext context) {
    showMonthPicker(
      context: context,
      initialDate: DateTime.now(),
    ).then((date) {
      if (date != null) {
        setState(() {
          widget.monthController.text = "${date.month}/${date.year}";
        });
      }
    });
  }

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
        width: responsiveWidth,
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
                  child: Container(
                    height: responsiveHeight,
                    child: TextFormField(
                      controller: widget.monthController,
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
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.calendar_today),
                          onPressed: () {
                            _pickMonth(context);
                          },
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
                ),
                const SizedBox(width: 8.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
