import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:spruko/accrodation/accordation_model.dart';

class BasicAccordion extends StatelessWidget {
  const BasicAccordion({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Accordion(
        maxOpenSections: 1,
        // headerBorderColor: Color.fromARGB(255, 194, 186, 186),
        headerBorderColorOpened: Colors.grey,
        // headerBackgroundColor: Colors.white,
        // headerBackgroundColorOpened: Colors.grey,
        // headerBorderRadius: 6,
        // headerBorderWidth: 1,
        // contentBackgroundColor: Colors.white,
        // contentBorderColor: Colors.grey,
        // contentBorderWidth: 1,
        contentHorizontalPadding: 20,
        scaleWhenAnimating: true,
        openAndCloseAnimation: true,
        headerPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
        sectionClosingHapticFeedback: SectionHapticFeedback.light,
        children: accordationSampleData.map((data) {
          return AccordionSection(
            isOpen: false,
            contentVerticalPadding: 5,
            header: Text(
              data.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
           rightIcon: const Icon(
            Icons.arrow_drop_down,
             color: Colors.grey,
               size: 24,
             ),

            content: Text(
              data.description,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
