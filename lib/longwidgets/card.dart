import 'package:flutter/material.dart';

class ContainerCard extends StatelessWidget {
  final String imageUrl;
  final double imageWidth;
  final double imageHeight;
  final String sampleText;
  final String secondaryText;
  final Color iconColor;
  final Color textColor;
  final Color containerColor;
  final IconData iconData;
  final String iconText;

  const ContainerCard({
    super.key,
    required this.imageUrl,
    this.imageWidth = 40.0,
    this.imageHeight = 40.0,
    required this.sampleText,
    required this.secondaryText,
    required this.iconColor,
    required this.textColor,
    required this.containerColor,
    required this.iconData,
    required this.iconText, 
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
       minWidth: 400
      ),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Image(
                  image: AssetImage(imageUrl),
                  width: imageWidth,
                  height: imageHeight,
                ),
                const SizedBox(height: 8.0),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Container(
                    width: 50.0,
                    height: 16.0,
                    decoration: BoxDecoration(
                      color: containerColor,
                      borderRadius: BorderRadius.circular(3.0),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          iconData,
                          size: 10,
                          color: iconColor,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          iconText,
                          style: TextStyle(
                            fontSize: 10.0,
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 4.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  sampleText,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  secondaryText,
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
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
