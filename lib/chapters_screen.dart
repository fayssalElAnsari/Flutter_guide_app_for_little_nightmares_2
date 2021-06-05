import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:listview_flutter_example_1/chapter_card.dart';
import 'package:provider/provider.dart';
import 'Chapter.dart';
import 'ad_state.dart';
import 'data.dart';

class ChaptersScreen extends StatefulWidget {
  const ChaptersScreen({Key key}) : super(key: key);

  @override
  _ChaptersScreenState createState() => _ChaptersScreenState();
}

class _ChaptersScreenState extends State<ChaptersScreen> {
  List<Object> itemList = [];
  final _controller = NativeAdmobController();

  @override
  void initState() {
    super.initState();
    // getData();
    itemList = List.from(chaptersData);
    FirebaseAdMob.instance
        .initialize(appId: 'ca-app-pub-3940256099942544/3419835294');
    _controller.setNonPersonalizedAds(true);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (this.mounted) {
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

  getData() {
    Future.delayed(
      Duration(milliseconds: 750),
    );
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Little Nightmares 2 Walkthrough",
          style: TextStyle(
              color: Colors.white, fontSize: 32.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildListView(context),
    );
  }

  Widget _buildListView(BuildContext context) {
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
        widgetList.add(ChapterCard(chapter: Chapter.fromJson(itemList[i])));
      }
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/blured_background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView(children: widgetList.toList()),
    );
  }
}
