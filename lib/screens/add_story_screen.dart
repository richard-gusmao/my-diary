import 'package:flutter/material.dart';
import 'package:my_diary/components/big_text_field.dart';

class AddStoryScreen extends StatefulWidget {
  const AddStoryScreen({super.key});

  @override
  State<AddStoryScreen> createState() => _AddStoryScreenState();
}

class _AddStoryScreenState extends State<AddStoryScreen> {
  final TextEditingController title = TextEditingController();
  final TextEditingController content = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Color.fromARGB(255, 45, 49, 66),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.blueAccent,
                    ),
                  ),
                  Text(
                    "Dairy",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      height: 2,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.save_alt,
                      // Icons.more_vert_outlined,
                      color: Colors.blueAccent,
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text("Sunday, 07 November 2021"),
              SizedBox(
                height: 20,
              ),
              BigTextField(
                myController: title,
                size: 30,
                height: 1.5,
                placeholder: "Write your title",
              ),
              SizedBox(
                height: 20,
              ),
              BigTextField(
                myController: content,
                size: 17,
                height: 2.5,
                placeholder: "Write you story here ",
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 239, 130, 84),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Hello"),
                  ),
                );
              },
              icon: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 35,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.mic,
                color: Colors.white,
                size: 35,
              ),
            )
          ],
        ),
      ),
    );
  }
}
