import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:spruko/accrodation/accordion.dart';
import 'package:spruko/accrodation/basic_accordation.dart';
import 'package:spruko/carousel/carousel.dart';
import 'package:spruko/dropdown/dropdownlist.dart';
import 'package:spruko/graph/revenuegraph.dart';
import 'package:spruko/navbar/transparent_nav.dart';
// import 'package:spruko/navbar/transparent_nav.dart';
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

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Center(
            child: Column(
              children: [
                Textname(
                  title: 'Type text',
                  hintext: 'Text',
                  width: isDesktop ? 700 : isTablet ? 600 : 500,
                  height: 60,
                  nameController: nameController,
                ),
                Typepassword(
                  title: 'Type Password',
                  hintText: 'Password',
                  width: isDesktop ? 700 : isTablet ? 600 : 500,
                  height: 110,
                  passwordController: passwordController,
                ),
                Typeemail(
                  title: 'Email',
                  hintext: 'Email@gmail.com',
                  width: isDesktop ? 700 : isTablet ? 600 : 500,
                  height: 140,
                  emailController: emailController,
                ),
                MobileNo(
                  title: 'Type tel',
                  hintext: '+1234567890',
                  width: isDesktop ? 700 : isTablet ? 600 : 500,
                  height: 110,
                  mobileController: mobileController,
                ),
                Text_number(
                  title: 'Type Number',
                  hintext: 'number',
                  width: isDesktop ? 700 : isTablet ? 600 : 500,
                  height: 60,
                  numberController: numberController,
                ),
                TypeDate(
                  title: 'Type Date',
                  hintext: 'dd-mm-yyyy',
                  width: isDesktop ? 700 : isTablet ? 600 : 500,
                  height: 60,
                  dateController: dateController,
                ),
                TypeWeek(
                  title: 'Type Week',
                  hintext: 'Week --,----',
                  width: isDesktop ? 700 : isTablet ? 600 : 500,
                  height: 60,
                  weekController: weekController,
                ),
                TypeTime(
                  title: 'Type Time',
                  hintext: '16:05',
                  width: isDesktop ? 700 : isTablet ? 600 : 500,
                  height: 60,
                  timeController: timeController,
                ),
                TypeMonth(
                  title: 'Type Month',
                  hintext: '------,----',
                  width: isDesktop ? 700 : isTablet ? 600 : 500,
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
                  width: isDesktop ? 700 : isTablet ? 600 : 500,
                  height: 60,
                  urlController: urlController,
                ),

                TransparentNav(
                  color: const Color.fromARGB(255, 145, 209, 238),
                  navBarHeight: screenHeight * 0.10,
                  navBarWidth: screenWidth*0.90,
                  imageUrl: 'lib/assets/images/blob.jpeg',
                  imageHeight: screenHeight * 0.05,
                  imageWidth: screenWidth * 0.05,
                  text1: 'Features',
                  text2: 'Pricing',
                  text3: 'About',
                  containerFocusColor: const Color.fromARGB(255, 30, 116, 156),
                  labelColor: const Color.fromARGB(255, 1, 31, 44),
                  containerWidth: screenWidth * 0.2,
                  containerHeight: screenHeight * 0.08,
                  hintText: 'Search',
                ),

            const SizedBox(height: 80),

            CustomDropdown(),
           const SizedBox(height: 80),


            Accordion1(),
           const SizedBox(height: 80),

          Carousel1(),
          const SizedBox(height: 80),
            
            const LineChartSample2(),



                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      String nameValue = nameController.text;
                      String dateValue = dateController.text;
                      String monthValue = monthController.text;
                      String numberValue = numberController.text;
                      String timeValue = timeController.text;
                      String weekValue = weekController.text;
                      String emailValue = emailController.text;
                      String passwordValue = passwordController.text;
                      String mobileValue = mobileController.text;
                      String urlValue = urlController.text;
            
                      // Do something with the values
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
