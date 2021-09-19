import 'package:flutter/material.dart';
import 'constant.dart';
import 'package:url_launcher/url_launcher.dart';

class OutputPage extends StatefulWidget {
  OutputPage(
      {@required this.bmi,
      @required this.resultText,
      @required this.suggestionText});

  final String bmi;
  final String resultText;
  final String suggestionText;
  @override
  _OutputPageState createState() => _OutputPageState();
}

class _OutputPageState extends State<OutputPage> {
  void customLauncher(command) async {
    if (await canLaunch(command)) {
      launch(command);
    } else {
      print("Failed to launch");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: aqua,
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            space,
            Center(
              child: Text(
                'Your result',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF505050),
                ),
              ),
            ),
            space,
            Container(
              decoration: BoxDecoration(
                color: Color(0x3027ccc4),
                borderRadius: BorderRadius.circular(15),
              ),
              height: 375,
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.resultText,
                    style: inputText,
                  ),
                  Text(
                    widget.bmi,
                    style: inputText,
                  ),
                  Text(
                    widget.suggestionText,
                    textAlign: TextAlign.center,
                    style: inputText,
                  ),
                ],
              ),
            ),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(white),
                elevation: MaterialStateProperty.all(5),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Color(0x7027ccc4),
                      width: 5,
                    ),
                  ),
                ),
              ),
              onPressed: () {
                customLauncher('https://en.wikipedia.org/wiki/Body_mass_index');
              },
              child: Text(
                'REFERENCE',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: grey,
                ),
              ),
            ),
            space,
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(aqua),
                elevation: MaterialStateProperty.all(5),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: aqua),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'RE-CALCULATE',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
