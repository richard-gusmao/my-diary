import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  final int year;
  final int memories;
  final bool isSelected;
  const MyCard(
      {super.key,
      required this.year,
      required this.memories,
      required this.isSelected});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: widget.isSelected
            ? Color.fromARGB(255, 79, 93, 117)
            : Color.fromARGB(255, 45, 49, 66),
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.year.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.memories.toString() + " Memories",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
