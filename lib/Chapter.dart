import 'package:listview_flutter_example_1/step_item.dart';

class Chapter {
  String title;
  String description;
  String imgUrl;
  List steps;
  int number;

  Chapter({this.title, this.description, this.imgUrl, this.steps, this.number});

  Chapter.fromJson(Map<String, dynamic> json) {
    this.title = json['title'];
    this.number = json['number'];
    this.description = json['description'];
    this.imgUrl = json['imgUrl'];
    this.steps = json['steps'];
    this.number = json['number'];
  }
}
