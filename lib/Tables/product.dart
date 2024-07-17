import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

class CustomPlutoGrid1 extends StatelessWidget {
  final double width;
  final double height;

  const CustomPlutoGrid1({Key? key, required this.width, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double responsiveWidth;
    if (screenWidth < 450) {
      responsiveWidth = screenWidth * 0.85; // for phones, reduce width
    } else if (screenWidth < 820) {
      responsiveWidth = width * 0.85; // for smaller tablets, reduce width
    } else {
      responsiveWidth = screenWidth * 0.85; // for larger tablets, reduce width
    }

    double responsiveHeight = screenWidth < 450 ? screenHeight * 0.45 : height * 0.85; // reduce height

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: Container(
        height: responsiveHeight,
        width: responsiveWidth,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color.fromARGB(255, 218, 212, 212)),
        ),
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
            const SizedBox(height: 10),
            const Divider(
              thickness: 0.2,
              color: Color.fromARGB(255, 153, 143, 143),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: PlutoGrid(
                columns: buildColumns(responsiveWidth),
                rows: buildRows(),
                onChanged: (PlutoGridOnChangedEvent event) {
                  // Handle changes if necessary
                },
                configuration: const PlutoGridConfiguration(
                  scrollbar: PlutoGridScrollbarConfig(
                    draggableScrollbar: false,
                    isAlwaysShown: false,
                  ),
                  columnSize: PlutoGridColumnSizeConfig(),
                  style: PlutoGridStyleConfig(
                    borderColor: Color.fromARGB(255, 218, 211, 211),
                    gridBorderColor: Color.fromARGB(255, 226, 221, 221),
                    columnHeight: 40,
                    rowHeight: 50,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PlutoColumn> buildColumns(double containerWidth) {
    return [
      PlutoColumn(
        title: 'S_No',
        field: 'number_field',
        type: PlutoColumnType.text(),
        enableContextMenu: false,
        width: containerWidth * 0.15,
        renderer: (rendererContext) {
          final sn = rendererContext.cell.value as String;
          return Text(sn, style: const TextStyle(color: Colors.black));
        },
      ),
      PlutoColumn(
        title: 'Title',
        field: 'title_field',
        type: PlutoColumnType.text(),
        enableContextMenu: false,
        width: containerWidth * 0.25,
        renderer: (rendererContext) {
          final title = rendererContext.cell.value as String;
          return Text(title, style: const TextStyle(color: Colors.black));
        },
      ),
      PlutoColumn(
        title: 'Assigned To',
        field: 'assigned_field',
        type: PlutoColumnType.text(),
        enableContextMenu: false,
        width: containerWidth * 0.2,
        renderer: (rendererContext) {
          final assignedTo = rendererContext.cell.value as Widget; // Use Widget type for custom renderer
          return assignedTo;
        },
      ),
      PlutoColumn(
        title: 'Progress',
        field: 'progress_field',
        type: PlutoColumnType.text(),
        renderer: (rendererContext) {
          final progress = rendererContext.cell.value as int;
          return SizedBox(
            height: 5,
            child: ProgressIndicator2(value: progress, progressBarHeight: 5, hideText: true),
          );
        },
      ),
      PlutoColumn(
        title: 'Status',
        field: 'status_field',
        type: PlutoColumnType.text(),
        enableContextMenu: false,
        width: containerWidth * 0.2,
        renderer: (rendererContext) {
          final status = rendererContext.cell.value as String;
          final statusColor = getStatusColor(status);
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: statusColor.backgroundColor,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: statusColor.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
      PlutoColumn(
        title: 'Due_Date',
        field: 'Date_field',
        type: PlutoColumnType.text(),
        enableContextMenu: false,
        width: containerWidth * 0.2,
        renderer: (rendererContext) {
          final dueDate = rendererContext.cell.value as String;
          return Text(dueDate, style: const TextStyle(color: Colors.black));
        },
      ),
    ];
  }

  List<PlutoRow> buildRows() {
    return [
      PlutoRow(
        cells: {
          'number_field': PlutoCell(value: '01'),
          'title_field': PlutoCell(value: 'Server side Validation'),
          'assigned_field': PlutoCell(value: _buildAvatarStack()), // Use the method to build stacked avatars
          'progress_field': PlutoCell(value: 3456),
          'status_field': PlutoCell(value: 'In Progress'),
          'Date_field': PlutoCell(value: '09-03-2000'),
        },
      ),
      PlutoRow(
        cells: {
          'number_field': PlutoCell(value: '02'),
          'title_field': PlutoCell(value: 'Multipurpose Dashboard template'),
          'assigned_field': PlutoCell(value: _buildAvatarStack()), // Use the method to build stacked avatars
          'progress_field': PlutoCell(value: 1234),
          'status_field': PlutoCell(value: 'Pending'),
          'Date_field': PlutoCell(value: '09-03-2000'),
        },
      ),
      PlutoRow(
        cells: {
          'number_field': PlutoCell(value: '03'),
          'title_field': PlutoCell(value: 'Documentation Project'),
          'assigned_field': PlutoCell(value: _buildAvatarStack()), // Use the method to build stacked avatars
          'progress_field': PlutoCell(value: 5678),
          'status_field': PlutoCell(value: 'Complete'),
          'Date_field': PlutoCell(value: '09-03-2000'),
        },
      ),
      PlutoRow(
        cells: {
          'number_field': PlutoCell(value: '04'),
          'title_field': PlutoCell(value: 'HR Management Template Design'),
          'assigned_field': PlutoCell(value: _buildAvatarStack()), // Use the method to build stacked avatars
          'progress_field': PlutoCell(value: 3456),
          'status_field': PlutoCell(value: 'In Progress'),
          'Date_field': PlutoCell(value: '09-03-2000'),
        },
      ),
      PlutoRow(
        cells: {
          'number_field': PlutoCell(value: '05'),
          'title_field': PlutoCell(value: 'Developing Backend'),
          'assigned_field': PlutoCell(value: _buildAvatarStack()), // Use the method to build stacked avatars
          'progress_field': PlutoCell(value: 1234),
          'status_field': PlutoCell(value: 'Pending'),
          'Date_field': PlutoCell(value: '09-03-2000'),
        },
      ),
    ];
  }

  Widget _buildAvatarStack() {
    return const Padding(
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
    );
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

class ProgressIndicator2 extends StatelessWidget {
  final int value;
  final double progressBarHeight;
  final bool hideText;

  const ProgressIndicator2({
    Key? key,
    required this.value,
    this.progressBarHeight = 8.0,
    this.hideText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!hideText) Text('progress: $value'),
        LinearProgressIndicator(
          value: value / 10000, // Adjusted for demonstration (change as needed)
          minHeight: progressBarHeight,
        ),
      ],
    );
  }
}

class StatusColor {
  final Color backgroundColor;
  final Color textColor;

  StatusColor(this.backgroundColor, this.textColor);
}
