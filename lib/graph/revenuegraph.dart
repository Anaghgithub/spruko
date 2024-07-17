import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:spruko/graph/revenueheader.dart';

class LineChartSample2 extends StatefulWidget {
  final double phoneHeight;
  final double phoneWidth;
  final double width;
  final double height;

  const LineChartSample2({
    super.key,
    required this.phoneHeight,
    required this.phoneWidth,
    required this.width,
    required this.height,
  });

  @override
  State<LineChartSample2> createState() => _LineChartSample2State();
}

class _LineChartSample2State extends State<LineChartSample2> {
  List<Color> gradientColors = [
    Colors.orange,
    Colors.orangeAccent,
  ];

  bool showAvg = false;

  List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'];
  List<double> revenues = [55, 50, 1.5, 24, 20, 32, 1];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;

        double width;
        double height = widget.height;

        if (screenWidth <= 600) {
          // Phone size
          width = widget.phoneWidth;
          height = widget.phoneHeight;
        } else if (screenWidth <= 1024) {
          // Tablet size
          width = screenWidth;
          height = widget.height;
        } else {
          // Full-screen size
          width = widget.width;
          height = widget.height;
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                const RevenueHeader(
                  imageUrl: 'lib/Assets/images/images.jpeg',
                  title: 'Revenue',
                  revenue: '\$12,897',
                  percentage: '3.5%',
                  percentageColor: Color.fromARGB(255, 95, 204, 98),
                ),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      SizedBox(
                        width: width,
                        height: height,
                        child: LineChart(
                          showAvg ? avgData() : mainData(),
                        ),
                      ),
                      Positioned(
                        child: SizedBox(
                          width: 60,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                showAvg = !showAvg;
                              });
                            },
                            child: Text(
                              'avg',
                              style: TextStyle(
                                fontSize: 12,
                                color: showAvg
                                    ? Colors.white.withOpacity(0.5)
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
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

  LineChartData mainData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((touchedSpot) {
              const textStyle = TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              );
              final month = months[touchedSpot.spotIndex];
              final revenue = revenues[touchedSpot.spotIndex];
              return LineTooltipItem(
                '$month\nRevenue: ${revenue.toStringAsFixed(2)}',
                textStyle,
              );
            }).toList();
          },
          tooltipRoundedRadius: 8,
          fitInsideHorizontally: true,
          fitInsideVertically: true,
        ),
      ),
      gridData: const FlGridData(
        show: false,
      ),
      titlesData: const FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 30,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            interval: 1,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 1),
            FlSpot(1, 3),
            FlSpot(2, 1.5),
            FlSpot(3, 2.5),
            FlSpot(4, 2),
            FlSpot(5, 3),
            FlSpot(6, 1),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: const LineTouchData(enabled: false),
      gridData: const FlGridData(
        show: false,
      ),
      titlesData: const FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 30,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.44),
            FlSpot(1, 3.44),
            FlSpot(2, 3.44),
            FlSpot(3, 3.44),
            FlSpot(4, 3.44),
            FlSpot(5, 3.44),
            FlSpot(6, 3.44),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
