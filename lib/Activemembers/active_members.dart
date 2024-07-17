import 'package:flutter/material.dart';
import 'package:spruko/Activemembers/progress_indicator.dart';
import 'package:spruko/graph/revenueheader.dart';

class ActiveMembers extends StatelessWidget {
  final double phoneWidth;
  final double phoneHeight;
  final double tabletHeight;
  final double tabletWidth;
  final double fullScreenWidth;
  final double fullScreenHeight;

  const ActiveMembers({
    super.key,
    required this.phoneWidth,
    required this.phoneHeight,
    required this.tabletHeight,
    required this.tabletWidth,
    required this.fullScreenWidth,
    required this.fullScreenHeight, required int width, required int height,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        double width;
        double height;

        if (screenWidth <= 600) {
          // Phone size
          width = phoneWidth;
          height = phoneHeight;
        } else if (screenWidth <= 1024) {
          // Tablet size
          width = screenWidth;
          height = tabletHeight;
        } else {
          // Full-screen size
          width = fullScreenWidth;
          height = fullScreenHeight;
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                RevenueHeader(
                  imageUrl: 'lib/Assets/images/contacticon.jpeg',
                  title: 'Active Members',
                  revenue: '\$12,897',
                  percentage: '3%',
                  percentageColor: Colors.green,
                ),
                SizedBox(height: 13),
                ProgressIndicator1(
                  value: 3274,
                  title: 'Active Candidates',
                  titleStyle: TextStyle(fontSize: 13, color: Colors.black),
                  valueStyle: TextStyle(fontSize: 13, color: Colors.black),
                ),
                SizedBox(height: 30),
                ProgressIndicator1(
                  value: 8726,
                  title: 'Active Recruiters',
                  titleStyle: TextStyle(fontSize: 13, color: Colors.black),
                  valueStyle: TextStyle(fontSize: 13, color: Colors.black),
                ),
                SizedBox(height: 30),
                Divider(thickness: 0.3),
                SizedBox(height: 10),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'View Details',
                        style: TextStyle(color: Color.fromARGB(255, 14, 65, 153)),
                      ),
                      Icon(Icons.open_in_new, color: Color.fromARGB(255, 14, 65, 153)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
