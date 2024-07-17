import 'package:flutter/material.dart';
import 'package:spruko/longwidgets/card.dart';

class DottedVerticalDivider extends StatelessWidget {
  const DottedVerticalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          20,
          (index) => Container(
            width: 1,
            height: 2,
            color: Colors.grey,
            margin: const EdgeInsets.symmetric(vertical: 2),
          ),
        ),
      ),
    );
  }
}

class LongContainer extends StatelessWidget {
  final double width;
  final double height;
  const LongContainer({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double responsiveWidth = getResponsiveWidth(screenWidth);
    double responsiveHeight = screenWidth < 450 ? screenHeight : height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: ConstrainedBox(
        constraints: BoxConstraints(minWidth: screenWidth),
        child: Container(
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
          child: screenWidth < 450
              ? buildWrap()
              : buildRow(),
        ),
      ),
    );
  }

  double getResponsiveWidth(double screenWidth) {
    if (screenWidth < 450) {
      return screenWidth * 0.9; // for phones
    } else if (screenWidth < 820) {
      return width; // for smaller tablets
    } else {
      return screenWidth * 0.9; // for larger tablets
    }
  }

  Widget buildWrap() {
    return const Wrap(
      spacing: 15,
      runSpacing: 10,
      children: [
        ContainerCard(
          imageUrl: 'lib/Assets/images/contacticon.jpeg',
          sampleText: '45,280',
          secondaryText: 'Total products',
          iconColor: Color.fromARGB(255, 19, 99, 21),
          textColor: Color.fromARGB(255, 19, 99, 21),
          containerColor: Color.fromARGB(255, 150, 223, 152),
          iconData: Icons.keyboard_arrow_up,
          iconText: '1.11%',
        ),
        ContainerCard(
          imageUrl: 'lib/Assets/images/contacticon.jpeg',
          sampleText: '10,500',
          secondaryText: 'Total Sales',
          iconColor: Colors.red,
          textColor: Colors.red,
          containerColor: Color.fromARGB(255, 241, 177, 172),
          iconData: Icons.keyboard_arrow_down,
          iconText: '2.22%',
        ),
        ContainerCard(
          imageUrl: 'lib/Assets/images/contacticon.jpeg',
          sampleText: '\$69,270',
          secondaryText: 'Income',
          iconColor: Color.fromARGB(255, 19, 99, 21),
          textColor: Color.fromARGB(255, 19, 99, 21),
          containerColor: Color.fromARGB(255, 150, 223, 152),
          iconData: Icons.keyboard_arrow_up,
          iconText: '3.33%',
        ),
        ContainerCard(
          imageUrl: 'lib/Assets/images/contacticon.jpeg',
          sampleText: '12,088',
          secondaryText: 'Total Orders',
          iconColor: Color.fromARGB(255, 19, 99, 21),
          textColor: Color.fromARGB(255, 19, 99, 21),
          containerColor: Color.fromARGB(255, 150, 223, 152),
          iconData: Icons.keyboard_arrow_up,
          iconText: '4.44%',
        ),
      ],
    );
  }

  Widget buildRow() {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ContainerCard(
            imageUrl: 'lib/Assets/images/contacticon.jpeg',
            sampleText: '45,280',
            secondaryText: 'Total products',
            iconColor: Color.fromARGB(255, 19, 99, 21),
            textColor: Color.fromARGB(255, 19, 99, 21),
            containerColor: Color.fromARGB(255, 150, 223, 152),
            iconData: Icons.keyboard_arrow_up,
            iconText: '1.11%',
          ),
        ),
        SizedBox(width: 4.0),
        DottedVerticalDivider(),
        SizedBox(width: 4.0),
        Expanded(
          child: ContainerCard(
            imageUrl: 'lib/Assets/images/contacticon.jpeg',
            sampleText: '10,500',
            secondaryText: 'Total Sales',
            iconColor: Colors.red,
            textColor: Colors.red,
            containerColor: Color.fromARGB(255, 241, 177, 172),
            iconData: Icons.keyboard_arrow_down,
            iconText: '2.22%',
          ),
        ),
        SizedBox(width: 4.0),
        DottedVerticalDivider(),
        SizedBox(width: 4.0),
        Expanded(
          child: ContainerCard(
            imageUrl: 'lib/Assets/images/contacticon.jpeg',
            sampleText: '\$69,270',
            secondaryText: 'Income',
            iconColor: Color.fromARGB(255, 19, 99, 21),
            textColor: Color.fromARGB(255, 19, 99, 21),
            containerColor: Color.fromARGB(255, 150, 223, 152),
            iconData: Icons.keyboard_arrow_up,
            iconText: '3.33%',
          ),
        ),
        SizedBox(width: 4.0),
        DottedVerticalDivider(),
        SizedBox(width: 4.0),
        Expanded(
          child: ContainerCard(
            imageUrl: 'lib/Assets/images/contacticon.jpeg',
            sampleText: '12,088',
            secondaryText: 'Total Orders',
            iconColor: Color.fromARGB(255, 19, 99, 21),
            textColor: Color.fromARGB(255, 19, 99, 21),
            containerColor: Color.fromARGB(255, 150, 223, 152),
            iconData: Icons.keyboard_arrow_up,
            iconText: '4.44%',
          ),
        ),
      ],
    );
  }
}
