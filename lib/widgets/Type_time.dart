import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TypeTime extends StatefulWidget {
  final String title;
  final String hintext;
  final double width;
  final double height;
  final TextEditingController timeController;

  const TypeTime({
    super.key,
    required this.title,
    required this.hintext,
    required this.width,
    required this.height,
    required this.timeController,
  });

  @override
  _TypeTimeState createState() => _TypeTimeState();
}

class _TypeTimeState extends State<TypeTime> {
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
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
                      controller: widget.timeController,
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
                          onPressed: () {
                            showCupertinoModalPopup(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 150,
                                        child: CupertinoDatePicker(
                                          mode: CupertinoDatePickerMode.time,
                                          initialDateTime: DateTime.now(),
                                          onDateTimeChanged: (DateTime newDateTime) {
                                            setState(() {
                                              widget.timeController.text =
                                                  "${newDateTime.hour}:${newDateTime.minute}";
                                            });
                                          },
                                        ),
                                      ),
                                      CupertinoButton(
                                        child: Text('Done'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.access_time),
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
