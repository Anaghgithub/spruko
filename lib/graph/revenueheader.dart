import 'package:flutter/material.dart';

class RevenueHeader extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String revenue;
  final String percentage;
  final Color percentageColor;

  const RevenueHeader({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.revenue,
    required this.percentage,
    required this.percentageColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 17,left: 20),
          child: Row(
            children: [
              Image(
                image: AssetImage(imageUrl),
                width: 37,
                height: 37,
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 8),
          child: Row(
            children: [
              Text(
                revenue,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.trending_up,
                color: percentageColor,
                size: 13,
              ),
              const SizedBox(width: 4),
              Text(
                percentage,
                style: TextStyle(
                  fontSize: 13,
                  color: percentageColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
