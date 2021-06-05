class StepItem {
  String title;
  String description;
  String imgUrl;
  int number;
  String chapterName;

  StepItem(
      {this.title,
      this.description,
      this.imgUrl,
      this.number,
      this.chapterName});

  StepItem.fromJson(Map<String, dynamic> json) {
    this.title = json['title'];
    this.number = json['number'];
    this.imgUrl = json['imgUrl'];
    this.number = json['number'];
    this.chapterName = json['chapterName'];
    this.description = json['description'];
  }
}
