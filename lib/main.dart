import 'package:flutter/material.dart';
import 'package:two_page/set.dart';
import 'package:two_page/sliding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

Map quest = {
  0: {
    "question":
        "When Gmail first launched, how much storage did it provide for your email?",
    "correct_answer": "1GB",
    "incorrect_answers": ["512MB", "5GB", "Unlimited"]
  },
  1: {
    "question": "HTML is what type of language?",
    "correct_answer": "Markup Language",
    "incorrect_answers": [
      "Macro Language",
      "Programming Language",
      "Scripting Language"
    ]
  },
  2: {
    "question": "What amount of bits commonly equals one byte?",
    "correct_answer": "8",
    "incorrect_answers": ["1", "2", "64"]
  },
};

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              leading: Text("Using setState"),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Pageset(
                      quest: quest,
                    ),
                  )),
            ),
            ListTile(
              leading: Text("Using Pageview"),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Slide(
                      quest: quest,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
