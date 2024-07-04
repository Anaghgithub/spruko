import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class TypeFile extends StatefulWidget {
  final String title;
  final String hintext;
  final double width;
  final double height;

  const TypeFile({
    Key? key,
    required this.title,
    required this.hintext,
    required this.width,
    required this.height,
  }) : super(key: key);

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
            GestureDetector(
              onTap: _pickFile,
              child: Container(
                width: widget.width*0.95,
                height: widget.height,
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
