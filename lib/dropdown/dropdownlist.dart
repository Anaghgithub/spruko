import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final double width;
  final double height;

  const CustomDropdown({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double dropdownWidth;
    if (screenWidth < 450) {
      dropdownWidth = screenWidth * 0.9; // for phones
    } else if (screenWidth < 820) {
      dropdownWidth = widget.width; // for smaller tablets
    } else {
      dropdownWidth = screenWidth * 0.9; // for larger tablets
    }

    double dropdownHeight = screenWidth < 450 ? screenHeight * 0.1 : widget.height;

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Container(
          width: dropdownWidth,
          height: dropdownHeight,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 12, 69, 116),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Select Item',
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).hintColor,
                  ),
                ),
              ),
              items: items
                  .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black, // Text color for items
                            ),
                          ),
                        ),
                      ))
                  .toList(),
              value: selectedValue,
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value;
                });
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.zero,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
