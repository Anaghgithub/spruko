// import 'package:flutter/material.dart';

// class ProductOverview extends StatelessWidget {
//   final List<String> orderNames;
//   final List<String> productIds;
//   final List<String> orderPrices;
//   final List<String> statuses;
//   final List<String> sales;
//   final List<String> revenues;

//   const ProductOverview({
//     Key? key,
//     required this.orderNames,
//     required this.productIds,
//     required this.orderPrices,
//     required this.statuses,
//     required this.sales,
//     required this.revenues, required List<String> orderImages,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double containerWidth = MediaQuery.of(context).size.width * 0.9;
//     double containerHeight = MediaQuery.of(context).size.height * 0.80;

//     return Material(
//       child: Container(
//         width: containerWidth,
//         height: containerHeight,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               spreadRadius: 2,
//               blurRadius: 5,
//               offset: const Offset(0, 3),
//             ),
//           ],
//         ),
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     'Recent Task',
//                     style: TextStyle(
//                       color: Colors.grey[600],
//                       fontWeight: FontWeight.bold,
//                       fontSize: 20,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Container(
//                   height: 40, // Set the height of the dropdown button
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   decoration: BoxDecoration(
//                     color: Colors.deepPurple,
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   child: DropdownButtonHideUnderline(
//                     child: DropdownButton<String>(
//                       hint: const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 12.0),
//                         child: Text(
//                           'View All',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                       icon: const Icon(Icons.arrow_drop_down,
//                           color: Colors.white),
//                       style: const TextStyle(color: Colors.black),
//                       dropdownColor: Colors.white,
//                       items: <String>['Field 1', 'Field 2', 'Field 3']
//                           .map((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                       onChanged: (_) {},
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),
//             Table(
//               border: TableBorder.all(color: Colors.grey[300]!),
//               columnWidths: const {
//                 0: FlexColumnWidth(1),
//                 1: FlexColumnWidth(2),
//                 2: FlexColumnWidth(2),
//                 3: FlexColumnWidth(2),
//                 4: FlexColumnWidth(2),
//                 5: FlexColumnWidth(2),
//               },
//               children: [
//                 const TableRow(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.all(16.0),
//                       child: Text('S.No',
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(16.0),
//                       child: Text('Title',
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(16.0),
//                       child: Text('Assigned To',
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(16.0),
//                       child: Text('Progress',
//                           style: TextStyle(fontWeight: FontWeight.bold))
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(16.0),
//                       child: Text('Status',
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(16.0),
//                       child: Text('DueDate',
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                     ),
//                   ],
//                 ),
//                 for (int index = 0; index < orderNames.length; index++)
//                   TableRow(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Text((index + 1).toString()),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Text(orderNames[index]),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Text(productIds[index]),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Text(orderPrices[index]),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 4.0, horizontal: 8.0),
//                           decoration: BoxDecoration(
//                             color:
//                                 getStatusColor(statuses[index]).backgroundColor,
//                             borderRadius: BorderRadius.circular(4.0),
//                           ),
//                           child: Center(
//                             child: Text(
//                               statuses[index],
//                               style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color:
//                                     getStatusColor(statuses[index]).textColor,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Text(sales[index]),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Text(revenues[index]),
//                       ),
//                     ],
//                   ),
//               ],
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }

//   StatusColor getStatusColor(String status) {
//     switch (status.toLowerCase()) {
//       case 'available':
//         return StatusColor(
//             Colors.green.withOpacity(0.2), Colors.green); // Translucent green with green text
//       case 'not available':
//         return StatusColor(
//             Colors.red.withOpacity(0.2), Colors.red); // Translucent red with red text
//       case 'limited deal':
//         return StatusColor(
//             Colors.orange.withOpacity(0.2), Colors.orange); // Translucent orange with orange text
//       case 'in offer':
//         return StatusColor(
//             Colors.purple.withOpacity(0.2), Colors.purple); // Translucent purple with purple text
//       default:
//         return StatusColor(
//             Colors.grey.withOpacity(0.2), Colors.black87); // Default translucent grey with dark text
//     }
//   }
// }

// class StatusColor {
//   final Color backgroundColor;
//   final Color textColor;

//   StatusColor(this.backgroundColor, this.textColor);
// }
