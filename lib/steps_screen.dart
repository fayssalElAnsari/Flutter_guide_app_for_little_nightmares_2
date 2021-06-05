import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:listview_flutter_example_1/step_card.dart';
import 'package:listview_flutter_example_1/step_item.dart';

import 'data.dart';

class StepsScreen extends StatefulWidget {
  const StepsScreen({Key key}) : super(key: key);
  static const routeName = '/home/steps';

  @override
  _StepsScreenState createState() => _StepsScreenState();
}

class _StepsScreenState extends State<StepsScreen> {
  List<Object> itemList = [];
  final _controller = NativeAdmobController();

  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-3940256099942544/3419835294');
    _controller.setNonPersonalizedAds(true);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (this.mounted) {
      Map data = {};
      data = ModalRoute.of(context).settings.arguments;
      int chapterNumber = data['number'];
      itemList = List.from(chaptersData[chapterNumber]['steps']);
      setState(() {
        for (int i = itemList.length - 2; i >= 1; i -= 2) {
          itemList.insert(
              i,
              NativeAdmob(
                adUnitID: NativeAd.testAdUnitId,
                controller: _controller,
              ));
        }
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    this.itemList.forEach((element) {
      if (element is NativeAd) {
        print("disposing of ad");
        element.dispose();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Map data = {};
    data = ModalRoute.of(context).settings.arguments;
    int chapterNumber = data['number'];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          data['Chapter Name'],
          style: TextStyle(
              color: Colors.white, fontSize: 34.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildListView(context, chapterNumber),
    );
  }

  //will loop through the steps and return the widgets
  Widget _buildListView(BuildContext context, int chapterNumber) {
    // itemList = List.from(chaptersData[chapterNumber]['steps']);
    List<Widget> widgetList = [];

    for (int i = 0; i < itemList.length; i++) {
      if (itemList[i] is NativeAdmob) {
        widgetList.add(
          Card(
            margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
            color: Colors.deepPurple,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                child: itemList[i],
              ),
            ),
          ),
        );
      } else {
        widgetList.add(StepCard(stepItem: StepItem.fromJson(itemList[i])));
      }
    }

    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/blured_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(children: widgetList.toList()));
  }
}
