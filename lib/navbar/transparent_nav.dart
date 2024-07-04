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
    Key? key,
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
  }) : super(key: key);

  @override
  _TransparentNavState createState() => _TransparentNavState();
}

class _TransparentNavState extends State<TransparentNav> {
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    bool isPhone = screenWidth < 600;

    double getMenuHeight() {
      if (isPhone && _isMenuOpen) {
        double itemHeight = 8.0 + 16.0;
        double searchHeight = widget.containerHeight + 16.0;
        return widget.navBarHeight + 10 + 3 * itemHeight + searchHeight + 10;
      }
      return widget.navBarHeight;
    }

    return Padding(
      padding: EdgeInsets.only(right: screenHeight * 0.02),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: getMenuHeight(),
          constraints: BoxConstraints(
            minHeight: widget.navBarHeight,
          ),
          width: widget.navBarWidth * 0.995,
          color: widget.color.withOpacity(0.8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: screenWidth * 0.001),
                    Padding(
                      padding: const EdgeInsets.only(top: 13),
                      child: Image.asset(
                        widget.imageUrl,
                        width: widget.imageWidth,
                        height: widget.imageHeight,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.003),
                    if (!isPhone)
                      Row(
                        children: [
                          const Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Button2(
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
                          SizedBox(width: screenWidth * 0.03),
                          Padding(
                            padding: const EdgeInsets.only(top: 13),
                            child: Text(
                              widget.text1,
                              style: TextStyle(
                                color: widget.labelColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          Padding(
                            padding: const EdgeInsets.only(top: 13),
                            child: Text(
                              widget.text2,
                              style: TextStyle(
                                color: widget.labelColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.03),
                          Padding(
                            padding: const EdgeInsets.only(top: 13),
                            child: Text(
                              widget.text3,
                              style: TextStyle(
                                color: widget.labelColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    const Spacer(),
                    if (!isPhone)
                      Container(
                        width: widget.containerWidth * 0.60,
                        height: widget.containerHeight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 11),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: widget.hintText,
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 13.0,
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
                    if (!isPhone) SizedBox(width: screenWidth * 0.005),
                    if (!isPhone)
                      const Padding(
                        padding: const EdgeInsets.only(top: 9),
                        child: Button2(
                          color: Color.fromARGB(255, 92, 58, 156),
                          text: 'search',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          height: 40,
                          width: 93,
                        ),
                      ),
                    if (!isPhone) SizedBox(width: screenWidth * 0.005),
                    if (isPhone)
                      IconButton(
                        icon: Icon(Icons.menu, color: widget.labelColor),
                        onPressed: () {
                          setState(() {
                            _isMenuOpen = !_isMenuOpen;
                          });
                        },
                      ),
                  ],
                ),
                if (isPhone && _isMenuOpen)
                  Column(
                    children: [
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                        child: Column(
                          children: [
                            Text(
                              widget.text1,
                              style: TextStyle(
                                color: widget.labelColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.text2,
                              style: TextStyle(
                                color: widget.labelColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.text3,
                              style: TextStyle(
                                color: widget.labelColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: widget.hintText,
                                    filled: true,
                                    fillColor: Colors.white,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16.0,
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
                            const Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Button2(
                                color: Color.fromARGB(255, 92, 58, 156),
                                text: 'search',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                                height: 49,
                                width: 93,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
