// import 'package:flutter/material.dart';

// class TypeSearch extends StatefulWidget {
//   final List<String> initialList;
//   final String hintext;
//   final TextEditingController searchController;
//   final String title;

//   const TypeSearch({
//     Key? key,
//     required this.initialList,
//     required this.hintext,
//     required this.searchController,
//     required this.title,
//   }) : super(key: key);

//   @override
//   _TypeSearchState createState() => _TypeSearchState();
// }

// class _TypeSearchState extends State<TypeSearch> {
//   List<String> filteredList = [];

//   @override
//   void initState() {
//     super.initState();
//     filteredList = widget.initialList;
//     widget.searchController.addListener(_filterList);
//   }

//   void _filterList() {
//     final query = widget.searchController.text.toLowerCase();
//     setState(() {
//       filteredList = widget.initialList
//           .where((item) => item.toLowerCase().contains(query))
//           .toList();
//     });
//   }

//   @override
//   void dispose() {
//     widget.searchController.removeListener(_filterList);
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           widget.title,
//           style: const TextStyle(
//             fontSize: 15.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 8.0),
//         TextFormField(
//           controller: widget.searchController,
//           decoration: InputDecoration(
//             hintText: widget.hintext,
//             border: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
//             ),
//           ),
//           autocorrect: true,
//           cursorColor: Colors.black.withOpacity(0.5),
//           style: const TextStyle(
//             color: Colors.black,
//             fontSize: 14,
//             fontWeight: FontWeight.w300,
//           ),
//         ),
//         Expanded(
//           child: ListView.builder(
//             itemCount: filteredList.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(filteredList[index]),
//                 onTap: () {
//                   widget.searchController.text = filteredList[index];
//                   setState(() {
//                     filteredList = [];
//                   });
//                 },
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
