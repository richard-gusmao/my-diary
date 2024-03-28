import 'package:flutter/material.dart';

class HomeCardPost extends StatelessWidget {
  final Map story;
  final int contentLength;
  const HomeCardPost(
      {super.key, required this.story, required this.contentLength});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            story['title'],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          // story['image'].toString() != ""
          //     ? Container(
          //         height: 100,
          //         width: double.infinity,
          //         decoration: BoxDecoration(),
          //         child: Image.file(
          //           fit: BoxFit.cover,
          //           File(
          //             story['image'],
          //           ),
          //         ),
          //       )
          //     : SizedBox(
          //         height: 20,
          //       ),
          Text("${story['content'].toString().substring(0, contentLength)} ...")
        ],
      ),
    );
  }
}
