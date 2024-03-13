// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picke';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Diary App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: DiaryScreen(),
//     );
//   }
// }

// class DiaryEntry {
//   final String text;
//   final List<File> images;

//   DiaryEntry(this.text, this.images);
// }

// class DiaryScreen extends StatefulWidget {
//   @override
//   _DiaryScreenState createState() => _DiaryScreenState();
// }

// class _DiaryScreenState extends State<DiaryScreen> {
//   TextEditingController _textEditingController = TextEditingController();
//   List<DiaryEntry> _entries = [];

//   List<Widget> _buildEntryWidgets() {
//     List<Widget> entryWidgets = [];
//     for (int i = 0; i < _entries.length; i++) {
//       entryWidgets.add(
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Text(_entries[i].text),
//             ),
//             SizedBox(
//               height: 8.0,
//             ),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: _entries[i].images
//                     .map((image) => Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Image.file(
//                             image,
//                             width: 100,
//                             height: 100,
//                           ),
//                         ))
//                     .toList(),
//               ),
//             ),
//             Divider(),
//           ],
//         ),
//       );
//     }
//     return entryWidgets;
//   }

//   Future<void> _addPhoto() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _entries.last.images.add(File(pickedFile.path));
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Diary'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView(
//               children: _buildEntryWidgets(),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _textEditingController,
//                     decoration: InputDecoration(
//                       hintText: 'Write your diary entry...',
//                       contentPadding: EdgeInsets.all(16.0),
//                     ),
//                     maxLines: null,
//                   ),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       _entries.add(DiaryEntry(
//                         _textEditingController.text,
//                         [],
//                       ));
//                       _textEditingController.clear();
//                     });
//                   },
//                   child: Text('Add Entry'),
//                 ),
//                 ElevatedButton(
//                   onPressed: _addPhoto,
//                   child: Text('Add Photo'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
