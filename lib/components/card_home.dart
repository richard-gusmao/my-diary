import 'package:flutter/material.dart';

class cardHome extends StatelessWidget {
  final String? date;
  final String? time;
  final String? image_;
  const cardHome({super.key, this.date, this.time, this.image_});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: image_ == null ? 80 : 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Icon(
                Icons.home,
                size: 30,
                color: Colors.black45,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("20:20"),
                      Text("."),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "07 de November 2021",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Color.fromARGB(255, 239, 130, 84),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
