import 'package:flutter/material.dart';

import 'package:listview_flutter_example_1/step_item.dart';

class StepCard extends StatelessWidget {
  final StepItem stepItem;

  const StepCard({this.stepItem});

  @override
  Widget build(BuildContext context) {
    print('assets/images/${stepItem.title}/step (${stepItem.number}).webp');

    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      color: Colors.deepPurple,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                stepItem.title,
                style: TextStyle(color: Colors.white, fontSize: 34.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Image.asset('assets/images/${stepItem.chapterName}/step (${stepItem.number}).webp'),
            SizedBox(height: 8),
            Text(stepItem.description,
                style: TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
