import 'package:flutter/material.dart';

class Slide extends StatefulWidget {
  final Map quest;
  Slide({Key key, this.quest}) : super(key: key);

  @override
  _SlideState createState() => _SlideState();
}

class _SlideState extends State<Slide> {
  //int index = 0;
  int _radiovalue = -1;
  PageController _controller = PageController();

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radiovalue = value;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: widget.quest.length,
        itemBuilder: (context, index) {
          return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                  _controller.nextPage(
                      duration: Duration(
                        microseconds: 10,
                      ),
                      curve: Curves.easeIn);
                },
              ),
            )
          ]);
        },
      ),
    );
  }
}
