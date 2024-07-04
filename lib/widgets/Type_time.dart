import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TypeTime extends StatefulWidget {
  final String title;
  final String hintext;
  final double width;
  final double height;
  final TextEditingController timeController;


  TypeTime({
    Key? key,
    required this.title,
    required this.hintext,
    required this.width,
    required this.height,
    required this.timeController,
  }) : super(key: key);

  @override
  _TypeTimeState createState() => _TypeTimeState();
}

class _TypeTimeState extends State<TypeTime> {
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(
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
            Row(
              children: [
                Container(
                  width: widget.width*0.785,
                  height: widget.height,
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
                              widget.timeController.text = "${newDateTime.hour}:${newDateTime.minute}";
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
                const SizedBox(width: 8.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
