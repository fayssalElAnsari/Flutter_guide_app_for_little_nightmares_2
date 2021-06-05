import 'package:flutter/material.dart';
import 'Chapter.dart';

class ChapterCard extends StatefulWidget {
  final Chapter chapter;

  ChapterCard({this.chapter});

  @override
  _ChapterCardState createState() => _ChapterCardState();

}

class _ChapterCardState extends State<ChapterCard> {

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      color: Colors.deepPurple,
      child: InkWell(
        onTap: () => {
          Navigator.pushNamed(context, '/home/steps', arguments: {
            'Chapter Name': this.widget.chapter.title,
            'number': widget.chapter.number
          })
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  widget.chapter.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 34.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Image.asset(widget.chapter.imgUrl),
              SizedBox(height: 8),
              Text(widget.chapter.description,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4),
            ],
          ),
        ),
      ),
    );
  }
}
