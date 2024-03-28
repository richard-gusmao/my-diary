import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_diary/model/diary_model.dart';
import 'package:my_diary/screens/edit_story_screen.dart';

class ShowStoryScreen extends StatefulWidget {
  final int id;
  const ShowStoryScreen({super.key, required this.id});

  @override
  State<ShowStoryScreen> createState() => _ShowStoryScreenState();
}

class _ShowStoryScreenState extends State<ShowStoryScreen> {
  List story = [];
  Future<void> getStory() async {
    List data = await Diary(id: widget.id).getById();
    setState(() {
      story = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                    "Show Dairy",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      height: 2,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditStoryScreen(id: widget.id),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.edit_calendar,
                      color: Color.fromARGB(255, 239, 130, 84),
                      size: 30,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              story.length != 0
                  ? Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            story[0]['title'],
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          story[0]['image'] != ""
                              ? Image.file(
                                  File(
                                    story[0]['image'],
                                  ),
                                )
                              : SizedBox(
                                  height: 1,
                                ),
                          Text(
                            story[0]['content'],
                            style: TextStyle(
                              height: 2,
                            ),
                          )
                        ],
                      ),
                    )
                  : SizedBox(
                      height: 200,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
