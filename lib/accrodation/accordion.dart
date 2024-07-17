import 'package:flutter/material.dart';
import 'package:spruko/accrodation/accordation_model.dart';

class Accordion1 extends StatefulWidget {
  final double width;
  final double height;

  const Accordion1({super.key, required this.width, required this.height});

  @override
  _Accordion1State createState() => _Accordion1State();
}

class _Accordion1State extends State<Accordion1> {
  int? _currentIndex;

  void _toggleExpansion(int index) {
    setState(() {
      if (_currentIndex == index) {
        _currentIndex = null;
      } else {
        _currentIndex = index;
      }
    });
  }

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

      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            accordationSampleData.length,
            (index) => _buildContainer(
              index,
              accordationSampleData[index].title,
              accordationSampleData[index].description,
              responsiveWidth,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContainer(int index, String title, String expandedContent, double width) {
    bool isExpanded = _currentIndex == index;
    return Column(
      children: [
        GestureDetector(
          onTap: () => _toggleExpansion(index),
          child: Container(
            width: width,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(index == 0 ? 8.0 : 0.0),
                bottom: Radius.circular(index == accordationSampleData.length - 1 && !isExpanded ? 8.0 : 0.0),
              ),
              border: Border.all(color: Colors.grey.shade300, width: 1.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                Icon(
                  isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: Colors.grey,
                  size: 24,
                ),
              ],
            ),
          ),
        ),
        if (isExpanded)
          Container(
            width: width,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Colors.grey.shade300, width: 1.0),
                right: BorderSide(color: Colors.grey.shade300, width: 1.0),
                bottom: BorderSide(color: Colors.grey.shade300, width: 1.0),
              ),
            ),
            child: Text(expandedContent),
          ),
      ],
    );
  }
}
