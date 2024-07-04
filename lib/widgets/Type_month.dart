import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';

class TypeMonth extends StatefulWidget {
  final String title;
  final String hintext;
  final double width;
  final double height;
  final TextEditingController monthController;

  TypeMonth({
    Key? key,
    required this.title,
    required this.hintext,
    required this.width,
    required this.height,
    required this.monthController,
  }) : super(key: key);

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
    return Padding(
      padding:  EdgeInsets.only(
        left: widget.width * 0.02,
        right: widget.height * 0.02,
      ),
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
                        icon: Icon(Icons.calendar_today),
                        onPressed: () {
                          _pickMonth(context);
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'This Field is required';
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
                const SizedBox(width: 8.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
