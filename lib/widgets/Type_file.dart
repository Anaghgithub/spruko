import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class TypeFile extends StatefulWidget {
  final String title;
  final String hintext;
  final double width;
  final double height;

  const TypeFile({
    super.key,
    required this.title,
    required this.hintext,
    required this.width,
    required this.height,
  });

  @override
  _TypeFileState createState() => _TypeFileState();
}

class _TypeFileState extends State<TypeFile> {
  String? selectedFileName;

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        selectedFileName = result.files.single.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double responsiveWidth;
    if (screenWidth < 450) {
      responsiveWidth = screenWidth * 0.95; // for phones
    } else if (screenWidth < 820) {
      responsiveWidth = widget.width; // for smaller tablets
    } else {
      responsiveWidth = screenWidth * 0.95; // for larger tablets
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
            GestureDetector(
              onTap: _pickFile,
              child: Container(
                width: responsiveWidth,
                height: responsiveHeight,
                child: TextFormField(
                  readOnly: true,
                  onTap: _pickFile,
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
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                  controller: TextEditingController(text: selectedFileName ?? ""),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
