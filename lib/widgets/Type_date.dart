import 'package:flutter/material.dart';

class TypeDate extends StatefulWidget {
  final String title;
  final String hintext;
  final double width;
  final double height;
  final TextEditingController dateController;

  const TypeDate({
    Key? key,
    required this.title,
    required this.hintext,
    required this.width,
    required this.height,
    required this.dateController,
  }) : super(key: key);

  @override
  _TypeDateState createState() => _TypeDateState();
}

class _TypeDateState extends State<TypeDate> {
  List<DateTime?> _dates = [null];

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dates[0] ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _dates[0]) {
      setState(() {
        _dates = [picked];
        widget.dateController.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
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
                      controller: widget.dateController,
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
                          onPressed: () => _selectDate(context),
                          icon: const Icon(Icons.calendar_today),
                        ),
                      ),
                      readOnly: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a date';
                        }
                        return null;
                      },
                      autocorrect: false,
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
