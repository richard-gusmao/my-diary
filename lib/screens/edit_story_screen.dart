import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_diary/components/big_text_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_diary/model/diary_model.dart';
import 'package:my_diary/screens/record_screen.dart';
import 'package:path_provider/path_provider.dart';

class EditStoryScreen extends StatefulWidget {
  final int id;
  const EditStoryScreen({super.key, required this.id});

  @override
  State<EditStoryScreen> createState() => _EditStoryScreenState();
}

class _EditStoryScreenState extends State<EditStoryScreen> {
  final TextEditingController title = TextEditingController();
  final TextEditingController content = TextEditingController();
  final imagePicker = ImagePicker();
  XFile? image_;
  bool loadingSave = false;
  String imagePath = "";
  List story = [];
  Future<void> getStory() async {
    List data = await Diary(id: widget.id).getById();
    setState(() {
      story = data;
      title.text = story[0]['title'];
      content.text = story[0]['content'];
      imagePath = story[0]['image'];
    });
  }

  Future<void> SaveStory() async {
    setState(() {
      loadingSave = true;
    });
    Diary diary = Diary(
        title: title.text,
        image: imagePath,
        content: content.text,
        id: widget.id);
    diary.update();
    setState(() {
      loadingSave = false;
    });
  }

  Future<void> pickImage() async {
    try {
      final XFile? image =
          await imagePicker.pickImage(source: ImageSource.gallery);
      Directory directory = await getApplicationDocumentsDirectory();
      image?.saveTo(directory.path + image.name);
      setState(() {
        image_ = image;
        imagePath = directory.path + image!.name;
      });
    } catch (err) {
      debugPrint("Something went Wrong picking the Image");
    }
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
                    onPressed: () {
                      SaveStory();
                    },
                    icon: Icon(
                      Icons.save_alt,
                      // Icons.more_vert_outlined,
                      color: Color.fromARGB(255, 239, 130, 84),
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
              imagePath != ""
                  ? Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: Image.file(
                        File(
                          imagePath,
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 1,
                    ),
              BigTextField(
                myController: content,
                size: 17,
                height: 2.5,
                placeholder: "Write you story here ",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 239, 130, 84),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                pickImage();
              },
              icon: Icon(
                Icons.camera_alt,
                color: Colors.white,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RecoredScreen()));
              },
              icon: Icon(
                Icons.mic,
                color: Colors.white,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
