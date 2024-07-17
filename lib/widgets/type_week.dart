import 'package:flutter/material.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

class TypeWeek extends StatefulWidget {
  final String title;
  final String hintext;
  final double width;
  final double height;
  final TextEditingController weekController;

  TypeWeek({
    Key? key,
    required this.title,
    required this.hintext,
    required this.width,
    required this.height,
    required this.weekController,
  }) : super(key: key);

  @override
  _TypeWeekState createState() => _TypeWeekState();
}

class _TypeWeekState extends State<TypeWeek> {
  DateTime? _selectedDay;

  String? _validateName(String? value) {
    if (_selectedDay == null) {
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
                      controller: widget.weekController,
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
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 300,
                                  child: WeeklyDatePicker(
                                    selectedDay: _selectedDay ?? DateTime.now(),
                                    changeDay: (value) {
                                      setState(() {
                                        _selectedDay = value;
                                        widget.weekController.text = "${value.toLocal()}".split(' ')[0];
                                      });
                                      Navigator.pop(context);
                                    },
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.calendar_today),
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
