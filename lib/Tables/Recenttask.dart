import 'package:flutter/material.dart';
import 'package:spruko/Activemembers/progress_indicator.dart';

class ProductOverview extends StatelessWidget {
  final List<String> orderNames;
  final List<String> productIds;
  final List<String> progress;
  final List<String> statuses;
  final List<String> dueDate;

  const ProductOverview({
    super.key,
    required this.orderNames,
    required this.productIds,
    required this.progress,
    required this.statuses,
    required this.dueDate,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth * 0.9;
    double containerHeight = screenWidth < 450 ? MediaQuery.of(context).size.height * 0.5 : MediaQuery.of(context).size.height * 0.5;

    int getVisibleColumnCount(double width) {
      if (width < 600) {
        return 2;
      } else if (width < 800) {
        return 3;
      } else if (width < 1000) {
        return 4;
      } else {
        return 6;
      }
    }

    int visibleColumns = getVisibleColumnCount(screenWidth);

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
            minWidth: 900,
          ),
          child: Container(
            width: containerWidth,
            height: containerHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Recent Task',
                        style: TextStyle(
                          color: Color.fromARGB(255, 15, 14, 14),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'View All',
                              style: TextStyle(color: Color.fromARGB(255, 180, 178, 178)),
                            ),
                          ),
                          icon: const Icon(Icons.arrow_drop_down_sharp, color: Color.fromARGB(255, 109, 105, 105)),
                          style: const TextStyle(color: Colors.black),
                          dropdownColor: Colors.white,
                          items: <String>['Field 1', 'Field 2', 'Field 3'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (_) {},
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Table(
                      border: TableBorder.all(color: Colors.grey[300]!),
                      columnWidths: {
                        for (int i = 0; i < visibleColumns; i++) i: const FlexColumnWidth(),
                      },
                      children: [
                        TableRow(
                          children: _getHeaders(visibleColumns),
                        ),
                        for (int index = 0; index < orderNames.length; index++)
                          TableRow(
                            children: _getRowData(index, visibleColumns),
                          ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _getHeaders(int visibleColumns) {
    List<String> headers = ['S.No', 'Title', 'Assigned To', 'Progress', 'Status', 'DueDate'];
    return List.generate(visibleColumns, (index) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(headers[index], style: const TextStyle(fontWeight: FontWeight.bold)),
      );
    });
  }

  List<Widget> _getRowData(int index, int visibleColumns) {
    List<Widget> rowData = [
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text((index + 1).toString()),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(orderNames[index]),
      ),
      const Padding(
        padding: EdgeInsets.all(16.0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('lib/Assets/images/girl.png'), // First image
            ),
            Positioned(
              left: 15, // Adjust overlap
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('lib/Assets/images/girl.png'), // Second image
              ),
            ),
            Positioned(
              left: 35, // Adjust overlap
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('lib/Assets/images/boy.jpeg'), // Third image
              ),
            ),
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.all(10.0),
        child: ProgressIndicator1(value: 8789, progressBarColor: Color.fromARGB(255, 8, 46, 77)), // Accessing progress based on index
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          decoration: BoxDecoration(
            color: getStatusColor(statuses[index]).backgroundColor,
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Center(
            child: Text(
              statuses[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: getStatusColor(statuses[index]).textColor,
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(dueDate[index]),
      ),
    ];
    return rowData.sublist(0, visibleColumns);
  }

  StatusColor getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'in progress':
        return StatusColor(Colors.orange.withOpacity(0.2), Colors.orange);
      case 'pending':
        return StatusColor(Colors.red.withOpacity(0.2), Colors.red);
      case 'complete':
        return StatusColor(Colors.green.withOpacity(0.2), Colors.green);
      default:
        return StatusColor(Colors.grey.withOpacity(0.2), Colors.black87);
    }
  }
}

class StatusColor {
  final Color backgroundColor;
  final Color textColor;

  StatusColor(this.backgroundColor, this.textColor);
}
