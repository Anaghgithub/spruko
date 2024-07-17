import 'package:flutter/material.dart';
import 'package:spruko/Button/button2.dart';

class TransparentNav extends StatefulWidget {
  final Color color;
  final double navBarHeight;
  final double navBarWidth;
  final String imageUrl;
  final double imageHeight;
  final double imageWidth;
  final String text1;
  final String text2;
  final String text3;
  final Color containerFocusColor;
  final Color labelColor;
  final double containerWidth;
  final double containerHeight;
  final String hintText;

  const TransparentNav({
    super.key,
    required this.color,
    required this.navBarHeight,
    required this.navBarWidth,
    required this.imageUrl,
    required this.imageHeight,
    required this.imageWidth,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.containerFocusColor,
    required this.labelColor,
    required this.containerWidth,
    required this.containerHeight,
    required this.hintText,
  });

  @override
  _TransparentNavState createState() => _TransparentNavState();
}

class _TransparentNavState extends State<TransparentNav> {
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isPhone = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth < 1024;
    bool isFullScreen = !isPhone && !isTablet;

    double getMenuHeight() {
      if ((isPhone || isTablet) && _isMenuOpen) {
        double itemHeight = 8.0 + 16.0;
        double searchHeight = widget.containerHeight + 16.0;
        return widget.navBarHeight + 10 + 3 * itemHeight + searchHeight + 10;
      }
      return widget.navBarHeight;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: getMenuHeight(),
          constraints: BoxConstraints(
            minHeight: widget.navBarHeight,
            maxHeight: (isPhone || isTablet) && _isMenuOpen ? double.infinity : widget.navBarHeight,
          ),
          width: isPhone || isTablet ? screenWidth : widget.navBarWidth * 0.995,
          color: widget.color.withOpacity(0.8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildNavBarRow(isPhone, isTablet, isFullScreen, screenWidth),
              if ((isPhone || isTablet) && _isMenuOpen) buildMenuColumn(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNavBarRow(bool isPhone, bool isTablet, bool isFullScreen, double screenWidth) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildLogo(),
        if (!isPhone && !isTablet) buildNavTexts(),
        Spacer(),
        if (isFullScreen) buildSearchBar(),
        if (isFullScreen) const SizedBox(width: 8.0),
        if (isFullScreen) buildSearchButton(),
        if (isFullScreen) const SizedBox(width: 18.0),
        if (isPhone || isTablet) buildMenuIcon(),
      ],
    );
  }

  Widget buildLogo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        widget.imageUrl,
        width: widget.imageWidth,
        height: widget.imageHeight,
      ),
    );
  }

  Widget buildNavTexts() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: const Button2(
            color: Color.fromARGB(255, 132, 91, 207),
            text: 'Home',
            style: TextStyle(
              fontSize: 10,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            height: 30,
            width: 76,
          ),
        ),
        const SizedBox(width: 20.0),
        Text(
          widget.text1,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 20.0),
        Text(
          widget.text2,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(width: 20.0),
        Text(
          widget.text3,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget buildSearchBar() {
    return Container(
      width: widget.containerWidth * 0.80,
      height: 40,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: widget.hintText,
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 8.0),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(31, 78, 77, 77),
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: widget.containerFocusColor,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSearchButton() {
    return const Button2(
      color: Color.fromARGB(255, 92, 58, 156),
      text: 'search',
      style: TextStyle(
        fontSize: 14,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      height: 40,
      width: 93,
    );
  }

  Widget buildMenuIcon() {
    return Container(
      padding: const EdgeInsets.only(top: 18, right: 10),
      child: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.grey,
          size: 18,
        ),
        onPressed: () {
          setState(() {
            _isMenuOpen = !_isMenuOpen;
          });
        },
      ),
    );
  }

  Widget buildMenuColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Features',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Pricing',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'About',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 2.0, bottom: 10),
                  child: Container(
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: widget.hintText,
                        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 8.0,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(31, 78, 77, 77),
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: widget.containerFocusColor,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                child: const Button2(
                  color: Color.fromARGB(255, 92, 58, 156),
                  text: 'search',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                  height: 43,
                  width: 88,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
