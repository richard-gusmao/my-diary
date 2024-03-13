import 'package:flutter/material.dart';

class MonthCard extends StatelessWidget {
  final String month;
  final bool isSelected;
  const MonthCard({super.key, required this.month, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected
            ? Color.fromARGB(255, 239, 130, 84)
            : Color.fromARGB(197, 239, 130, 84),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        month,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
