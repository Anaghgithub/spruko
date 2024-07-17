import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

class CustomPlutoGrid extends StatelessWidget {
  final double width;
  final double height;
  const CustomPlutoGrid({Key? key, required this.width, required this.height}) : super(key: key);

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
        height: responsiveHeight, // Adjust height responsively
        width: responsiveWidth, // Adjust width responsively
        padding: const EdgeInsets.only(right: 16, left: 16, top: 16), // Add padding for space around the grid
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color.fromARGB(255, 218, 212, 212)), // Add grey border to the container
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left)
          children: [
            const Text(
              'Traffic sources',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              child: const Divider(
                thickness: 0.2,
                color: Color.fromARGB(255, 153, 143, 143),
              ),
            ),
            const SizedBox(height: 20), // Add some spacing between the text and the grid
            Expanded(
              child: PlutoGrid(
                columns: buildColumns(responsiveWidth), // Passing responsive width to the method
                rows: buildRows(),
                onChanged: (PlutoGridOnChangedEvent event) {
                  // Handle changes if necessary
                },
                configuration: const PlutoGridConfiguration(
                  scrollbar: PlutoGridScrollbarConfig(
                    draggableScrollbar: false,
                    isAlwaysShown: false,
                  ),
                  columnSize: PlutoGridColumnSizeConfig(
                    autoSizeMode: PlutoAutoSizeMode.none, // Disable column auto sizing
                  ),
                  style: PlutoGridStyleConfig(
                    borderColor: Color.fromARGB(255, 218, 211, 211), // Set border color to grey
                    gridBorderColor: Color.fromARGB(255, 226, 221, 221), // Set table border color to grey
                    columnHeight: 40, // Reduce column height
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
        title: 'Browser',
        field: 'browser_field', // Unique field name
        type: PlutoColumnType.text(),
        enableContextMenu: false, // Disable context menu
        width: containerWidth * 0.25, // Adjust width proportionally
        renderer: (rendererContext) {
          final browserName = rendererContext.cell.value as String;
          final browserImage = _getBrowserImage(browserName);
          return Row(
            children: [
              Image.asset(
                browserImage,
                width: 40,
                height: 40,
              ),
              const SizedBox(width: 8),
              Text(browserName, style: TextStyle(color: Colors.black)), // Set text color to black
            ],
          );
        },
      ),
      PlutoColumn(
        title: 'Session',
        field: 'session_field', // Unique field name
        type: PlutoColumnType.number(),
        width: containerWidth * 0.25, // Adjust width proportionally
        enableContextMenu: false, // Disable context menu
        renderer: (rendererContext) {
          final sessionValue = rendererContext.cell.value as int;
          return Row(
            children: [
              Text(sessionValue.toString(), style: TextStyle(color: Colors.black)), // Set text color to black
            ],
          );
        },
      ),
      PlutoColumn(
        title: 'Views',
        field: 'views_field', // Corrected field name
        type: PlutoColumnType.number(),
        width: containerWidth * 0.25, // Adjust width proportionally
        enableContextMenu: false, // Disable context menu
        renderer: (rendererContext) {
          final viewsValue = rendererContext.cell.value as int;
          return Text(viewsValue.toString(), style: TextStyle(color: Colors.black)); // Set text color to black
        },
      ),
      PlutoColumn(
        title: 'Traffic',
        field: 'traffic_field', // Unique field name
        type: PlutoColumnType.text(), // Use text type since we will use a custom renderer
        width: containerWidth * 0.25, // Adjust width proportionally
        enableContextMenu: false, // Disable context menu
        renderer: (rendererContext) {
          final views = rendererContext.cell.value as int;
          return SizedBox(
            height: 5,
            child: ProgressIndicator2(value: views, progressBarHeight: 5, hideText: true),
          );
        },
      ),
    ];
  }

  List<PlutoRow> buildRows() {
    return [
      PlutoRow(
        cells: {
          'browser_field': PlutoCell(value: 'Chrome'),
          'session_field': PlutoCell(value: 23379),
          'views_field': PlutoCell(value: 2247),
          'traffic_field': PlutoCell(value: 2247), // Set value here for use in the renderer
        },
      ),
      PlutoRow(
        cells: {
          'browser_field': PlutoCell(value: 'Firefox'),
          'session_field': PlutoCell(value: 78973),
          'views_field': PlutoCell(value: 16890),
          'traffic_field': PlutoCell(value: 16890), // Set value here for use in the renderer
        },
      ),
      PlutoRow(
        cells: {
          'browser_field': PlutoCell(value: 'Safari'),
          'session_field': PlutoCell(value: 12457),
          'views_field': PlutoCell(value: 29906),
          'traffic_field': PlutoCell(value: 29906), // Set value here for use in the renderer
        },
      ),
      PlutoRow(
        cells: {
          'browser_field': PlutoCell(value: 'Edge'),
          'session_field': PlutoCell(value: 8570),
          'views_field': PlutoCell(value: 8674),
          'traffic_field': PlutoCell(value: 8674), // Set value here for use in the renderer
        },
      ),
      PlutoRow(
        cells: {
          'browser_field': PlutoCell(value: 'Edge'),
          'session_field': PlutoCell(value: 6135),
          'views_field': PlutoCell(value: 4980),
          'traffic_field': PlutoCell(value: 4980), // Set value here for use in the renderer
        },
      ),
      PlutoRow(
        cells: {
          'browser_field': PlutoCell(value: 'Edge'),
          'session_field': PlutoCell(value: 4789),
          'views_field': PlutoCell(value: 4436),
          'traffic_field': PlutoCell(value: 4436), // Set value here for use in the renderer
        },
      ),
    ];
  }

  String _getBrowserImage(String browserName) {
    switch (browserName) {
      case 'Chrome':
        return 'lib/Assets/images/boy.jpeg';
      case 'Firefox':
        return 'lib/Assets/images/girl.png';
      case 'Safari':
        return 'lib/Assets/images/girl.png';
      case 'Edge':
        return 'lib/Assets/images/boy.jpeg';
      default:
        return 'lib/Assets/images/boy.jpeg';
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
        if (!hideText) Text('Views: $value'),
        LinearProgressIndicator(
          value: value / 100000,
          minHeight: progressBarHeight,
        ),
      ],
    );
  }
}
