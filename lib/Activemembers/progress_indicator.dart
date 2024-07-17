import 'package:flutter/material.dart';
import 'package:simple_progress_indicators/simple_progress_indicators.dart';

class ProgressIndicator1 extends StatelessWidget {
  final value;
  final String? title;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final double progressBarHeight;
  final Color progressBarColor; // Added progressBarColor

  const ProgressIndicator1({
    super.key,
    this.value,
    this.title,
    this.titleStyle,
    this.valueStyle,
    this.progressBarHeight = 5.0,
    this.progressBarColor = Colors.green, // Default color
  });

  @override
  Widget build(BuildContext context) {
    double progressValue = value / 10000;

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 300,
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 20,right:20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null || value != null) // Check if title or value is not null
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (title != null) // Check if title is not null
                    Text(title!, style: titleStyle ?? const TextStyle(fontSize: 13)),
                  if (value != null) // Check if value is not null
                    Text('$value', style: valueStyle ?? const TextStyle(fontSize: 13)),
                ],
              ),
            const SizedBox(height: 8),
            Stack(
              children: [
                Container(
                  height: progressBarHeight,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3), // Grey background
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                ProgressBar(
                  value: progressValue,
                  height: progressBarHeight,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [progressBarColor, progressBarColor], // Use the provided color
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
