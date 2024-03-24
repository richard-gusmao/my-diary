import 'dart:io';

import 'package:my_diary/components/card_home.dart';
import 'package:my_diary/components/month_card.dart';
import 'package:my_diary/components/my_card.dart';
import 'package:flutter/material.dart';
import 'package:my_diary/model/diary_model.dart';
import 'package:my_diary/screens/search_screen.dart';
import 'package:my_diary/screens/setting_screen.dart';
import 'package:my_diary/screens/test.dart';

import 'add_story_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  List stories = [];
  Future<void> fecthData() async {
    List data = await Diary().showAll();
    setState(() {
      stories = data;
    });
  }

  @override
  void initState() {
    super.initState();
    fecthData();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fecthData();
  }

  @override
  void dispose() {
    setState(() {
      stories = [];
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 242, 242),
      appBar: AppBar(
        title: Text("Hello"),
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 40,
        ),
        backgroundColor: Color.fromARGB(255, 45, 49, 66),
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Good Morning!"),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Richard",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SearchScreen(),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.search,
                          color: Colors.blueAccent,
                          size: 30,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SettingScreen(),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.settings,
                          color: Colors.blueAccent,
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 239, 130, 84),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Diary().deleteAll();
                                print("All Post Deleted");
                              },
                              child: Text(
                                "Today",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "30",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "ºC",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          "Tue, 07 Nov 2024",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Huambo, Angola, Rua 11 de Novembro",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 90,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const MyCard(
                      memories: 100,
                      year: 2022,
                      isSelected: true,
                    ),
                    const MyCard(
                      year: 2021,
                      memories: 200,
                      isSelected: false,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Container(
              //   height: 40,
              //   child: ListView.builder(
              //       itemCount: 10,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) {
              //         // MONTH VARIABLE
              //         String m = months[index];
              //         return MonthCard(
              //             month: m, isSelected: index == 0 ? true : false);
              //       }),
              // ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: stories.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (contex, index) {
                      Map story = stories[index];
                      int contentLength = (story['content'].length >= 100)
                          ? 100
                          : story['content'].length;
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
                            Text(
                                "${story['content'].toString().substring(0, contentLength)} ...")
                          ],
                        ),
                      );
                    }),
              ),
              // cardHome(
              //   date: null,
              //   time: null,
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.art_track_sharp,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
              ),
              label: ""),
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 45, 49, 66),
          borderRadius: BorderRadius.circular(
            700,
          ),
        ),
        child: MaterialButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => AddStoryScreen()));
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
