import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:listview_flutter_example_1/steps_screen.dart';
import 'package:listview_flutter_example_1/chapters_screen.dart';
import 'package:listview_flutter_example_1/loading_screen.dart';
import 'package:provider/provider.dart';
import 'about_screen.dart';
import 'ad_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // final initFuture = MobileAds.instance.initialize();
  // final adState = AdState(initFuture);
  runApp(Provider.value(
      // value: adState,
    builder: (context, child) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Little Nightmares 2 Walkthrough",
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.deepPurple[900],
          accentColor: Colors.deepPurple,
          // Define the default font family.
          fontFamily: 'AmaticSC',
          textTheme: TextTheme(
              headline1: TextStyle(color: Colors.white),
              headline2: TextStyle(color: Colors.white))

          // Define the default TextTheme. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.


          ),
      initialRoute: '/home',
      routes: {
        '/': (context) => Loading(),
          '/home': (context) => ChaptersScreen(),
        '/home/steps': (context) => StepsScreen(),
        '/about': (context) => About(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('MyHomePage'),
    );
  }
}
