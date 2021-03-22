import 'package:flutter/material.dart';

class Pageset extends StatefulWidget {
  final Map quest;
  Pageset({Key key, this.quest}) : super(key: key);

  @override
  _PagesetState createState() => _PagesetState();
}

class _PagesetState extends State<Pageset> {
  int index = 0;
  int _radiovalue = -1;

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radiovalue = value;
    });
  }

//widget.quest[index]["incorrect_answers"][1]
  @override
  Widget build(BuildContext context) {
    //print(widget.quest[index]["incorrect_answers"]);

    //bool _isRadioSelected;
    //var value;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.green,
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Text(widget.quest[index]["question"]),
          ),
          SizedBox(
            height: 10,
          ),
          RadioListTile(
            value: 0,
            groupValue: _radiovalue,
            onChanged: _handleRadioValueChange1,
            title: Text(widget.quest[index]["correct_answer"]),
          ),
          RadioListTile(
            value: 1,
            groupValue: _radiovalue,
            onChanged: _handleRadioValueChange1,
            title: Text(widget.quest[index]["incorrect_answers"][0]),
          ),
          RadioListTile(
            value: 2,
            groupValue: _radiovalue,
            onChanged: _handleRadioValueChange1,
            title: Text(widget.quest[index]["incorrect_answers"][1]),
          ),
          RadioListTile(
            value: 3,
            groupValue: _radiovalue,
            onChanged: _handleRadioValueChange1,
            title: Text(widget.quest[index]["incorrect_answers"][2]),
          ),
          Center(
            child: ElevatedButton(
              child: Text("Next"),
              onPressed: () {
                print("Before click $index");
                setState(() {
                  // ignore: unnecessary_statements
                  index != widget.quest.length - 1 ? index++ : index;
                  //if (index != widget.quest.length - 1) index++;
                });
                print("After click $index");
              },
            ),
          )
        ],
      ),
    );
  }
}
