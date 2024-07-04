import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      return 'This Field is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Padding(
                padding: EdgeInsets.only(
                  left: widget.width * 0.02,
                  right: widget.height * 0.02,
                ),
                child: Container(
                  width: widget.width*0.785,
                  height: widget.height,
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
            ],
          ),
        ],
      ),
    );
  }
}
