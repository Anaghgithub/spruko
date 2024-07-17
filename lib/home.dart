import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:spruko/Activemembers/active_members.dart';
import 'package:spruko/Tables/Recenttask.dart';
import 'package:spruko/Tables/product.dart';
import 'package:spruko/Tables/table.dart';
import 'package:spruko/Tables/trafficsource_table.dart';
import 'package:spruko/accrodation/accordion.dart';
import 'package:spruko/carousel/carousel.dart';
import 'package:spruko/dropdown/dropdownlist.dart';
import 'package:spruko/graph/revenuegraph.dart';
import 'package:spruko/longwidgets/totalpro,sales.dart';
import 'package:spruko/navbar/transparent_nav.dart';
import 'package:spruko/widgets/Type_date.dart';
import 'package:spruko/widgets/Type_file.dart';
import 'package:spruko/widgets/Type_month.dart';
import 'package:spruko/widgets/Type_number.dart';
import 'package:spruko/widgets/Type_time.dart';
import 'package:spruko/widgets/Typeemail.dart';
import 'package:spruko/widgets/Typetel.dart';
import 'package:spruko/widgets/textname.dart';
import 'package:spruko/widgets/type_url.dart';
import 'package:spruko/widgets/type_week.dart';
import 'package:spruko/widgets/typepassword.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController nameController = TextEditingController();
    final TextEditingController dateController = TextEditingController();
    final TextEditingController monthController = TextEditingController();
    final TextEditingController numberController = TextEditingController();
    final TextEditingController timeController = TextEditingController();
    final TextEditingController weekController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController mobileController = TextEditingController();
    final TextEditingController urlController = TextEditingController();

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    bool isDesktop = ResponsiveBreakpoints.of(context).isDesktop;
    bool isTablet = ResponsiveBreakpoints.of(context).isTablet;

    double widgetWidth;
    if (isDesktop) {
      widgetWidth = screenWidth * 0.5;
    } else if (isTablet) {
      widgetWidth = screenWidth * 0.9;
    } else {
      widgetWidth = screenWidth * 0.9;
    }

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [

                  TransparentNav(
                                navBarHeight: 65,
                                color: const Color.fromARGB(255, 145, 209, 238),
                                // navBarHeight: screenHeight * 0.20,
                                navBarWidth: screenWidth,
                                imageUrl: 'lib/assets/images/blob.jpeg',
                                imageHeight: screenHeight * 0.08,
                                imageWidth: screenWidth * 0.08,
                                text1: 'Features',
                                text2: 'Pricing',
                                text3: 'About',
                                containerFocusColor: const Color.fromARGB(255, 30, 116, 156),
                                labelColor: Color.fromARGB(255, 84, 134, 155),
                                containerWidth: screenWidth * 0.2,
                                containerHeight: screenHeight * 0.08,
                                hintText: 'Search',
                              ),
              Textname(
                title: 'Type text',
                hintext: 'Text',
                width: isDesktop
                    ? 700
                    : isTablet
                        ? 600
                        : 500,
                height: 60,
                nameController: nameController,
              ),
              Typepassword(
                title: 'Type Password',
                hintText: 'Password',
                width: isDesktop
                    ? 700
                    : isTablet
                        ? 600
                        : 500,
                height: 90,
                passwordController: passwordController,
              ),
              Typeemail(
                title: 'Email',
                hintext: 'Email@gmail.com',
                width: isDesktop
                    ? 700
                    : isTablet
                        ? 600
                        : 500,
                height: 90,
                emailController: emailController,
              ),
              MobileNo(
                title: 'Type tel',
                hintext: '+1234567890',
                width: isDesktop
                    ? 700
                    : isTablet
                        ? 600
                        : 500,
                height: 110,
                mobileController: mobileController,
              ),
              Text_number(
                title: 'Type Number',
                hintext: 'number',
                width: isDesktop
                    ? 700
                    : isTablet
                        ? 600
                        : 500,
                height: 60,
                numberController: numberController,
              ),
              TypeDate(
                title: 'Type Date',
                hintext: 'dd-mm-yyyy',
                width: isDesktop
                    ? 700
                    : isTablet
                        ? 600
                        : 500,
                height: 60,
                dateController: dateController,
              ),
              TypeWeek(
                title: 'Type Week',
                hintext: 'Week --,----',
                width: isDesktop
                    ? 700
                    : isTablet
                        ? 600
                        : 500,
                height: 60,
                weekController: weekController,
              ),
              TypeTime(
                title: 'Type Time',
                hintext: '16:05',
                width: isDesktop
                    ? 700
                    : isTablet
                        ? 600
                        : 500,
                height: 60,
                timeController: timeController,
              ),
              TypeMonth(
                title: 'Type Month',
                hintext: '------,----',
                width: isDesktop
                    ? 700
                    : isTablet
                        ? 600
                        : 500,
                height: 60,
                monthController: monthController,
              ),
              const TypeFile(
                title: 'Type File',
                hintext: 'Choose File',
                width: 500,
                height: 60,
              ),
              TypeUrl(
                title: 'Type Url',
                hintext: 'http://example.url',
                width: isDesktop
                    ? 700
                    : isTablet
                        ? 600
                        : 500,
                height: 60,
                urlController: urlController,
              ),

              CustomDropdown(
                width: isDesktop
                    ? 700
                    : isTablet
                        ? 600
                        : 500,
                height: 40,
              ),

              Accordion1(
                width: isDesktop
                    ? 700
                    : isTablet
                        ? 600
                        : 500,
                height: 60,
              ),

              Carousel1(
                width: isDesktop
                    ? 700
                    : isTablet
                        ? 600
                        : 500,
                height: 300,
              ),

              LineChartSample2(
                width: isDesktop
                    ? 400
                    : isTablet
                        ? 900
                        : 500,
                height:280, 
                phoneHeight:280 , 
                phoneWidth: 400,
              ),

              ActiveMembers(
                width: isDesktop
                    ? 400
                    : isTablet
                        ? 900
                        : 500,
                height: 200,
                 phoneWidth: 400, phoneHeight: 300,
                  tabletHeight: 300, tabletWidth: 900,
                  fullScreenWidth: 400, fullScreenHeight: 300,
              ),

              CustomPlutoGrid(
                width: isDesktop
                    ? 700
                    : isTablet
                        ? 600
                        : 500,
                height: 400,
              ),

               LongContainer( 
                width: isDesktop
                    ? 50
                    : isTablet
                        ? 200
                        : 200,
                height: 130,
                
              ),

                           

                            const CustomPlutoGrid1(width: 700,
                            height: 500)   

            ],
          ),
        ),
      ),
    );
  }
}
