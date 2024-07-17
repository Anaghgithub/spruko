import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MobileNo extends StatefulWidget {
  final String title;
  final String hintext;
  final double width;
  final double height;
  final TextEditingController mobileController;

  const MobileNo({
    Key? key,
    required this.title,
    required this.hintext,
    required this.width,
    required this.height,
    required this.mobileController,
  }) : super(key: key);

  @override
  State<MobileNo> createState() => _MobileNoState();
}

class _MobileNoState extends State<MobileNo> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double responsiveWidth;

    if (screenWidth < 450) {
      responsiveWidth = screenWidth * 0.9; // for phones
    } else if (screenWidth < 820) {
      responsiveWidth = widget.width; // for smaller tablets
    } else {
      responsiveWidth = screenWidth * 0.9; // for larger tablets
    }


    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Container(
        width: responsiveWidth,
        height: widget.height,
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
                    controller: widget.mobileController,
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
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile number';
                      }
                      if (value.length != 10) {
                        return 'Mobile number must be exactly 10 digits';
                      }
                      return null;
                    },
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
