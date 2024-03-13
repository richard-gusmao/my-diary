class Diary {
  int id;
  String title;
  String content;
  DateTime date;
  String? image;

  Diary(
      {required this.title,
      required this.content,
      required this.id,
      this.image,
      required this.date});

  Future<void> save() async {}
}
