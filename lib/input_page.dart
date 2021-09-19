import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'calculator.dart';
import 'output_page.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int age = 1;
  int height = 180;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF27ccc4),
        title: Center(
          child: Text(
            'BMI Calculator',
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  space,
                  Text(
                    ' Gender',
                    style: label,
                  ),
                  space,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: GenderWidget(
                          press: () {
                            setState(() {
                              selectedGender = Gender.male;
                            });
                          },
                          genderName: ' MALE',
                          icon: FontAwesomeIcons.mars,
                          backgroundColour:
                              selectedGender == Gender.male ? aqua : white,
                          textColour:
                              selectedGender == Gender.male ? white : grey,
                        ),
                      ),
                      Container(
                        child: GenderWidget(
                          press: () {
                            setState(() {
                              selectedGender = Gender.female;
                            });
                          },
                          genderName: ' FEMALE',
                          icon: FontAwesomeIcons.venus,
                          backgroundColour:
                              selectedGender == Gender.female ? aqua : white,
                          textColour:
                              selectedGender == Gender.female ? white : grey,
                        ),
                      ),
                    ],
                  ),
                  space,
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' Age',
                    style: label,
                  ),
                  space,
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 50),
                    child: TextField(
                      style: inputText,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        hoverColor: grey,
                        suffixText: 'Year/s',
                        suffixStyle: TextStyle(
                          fontSize: 25,
                          color: grey,
                        ),
                        hintText: 'Age',
                        hintStyle: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  space,
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Weight',
                    style: label,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button(
                        icon: FontAwesomeIcons.minus,
                        onPress: () {
                          setState(() {
                            weight--;
                          });
                        },
                        onLongPress: (){
                          setState((){
                            weight=weight-10;
                          });
                        },

                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        weight.toString()+' kg',
                        style: inputText,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Button(
                        icon: FontAwesomeIcons.plus,
                        onPress: () {
                          setState(() {
                            weight++;
                          });
                        },
                        onLongPress: (){
                          setState((){
                            weight=weight+10;
                          });
                        },
                      ),
                    ],
                  ),
                  space,
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' Height',
                    style: label,
                  ),
                  space,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: inputText,
                      ),
                      Text(
                        'cm',
                        style: label,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: aqua,
                      inactiveTrackColor: grey,
                      overlayColor: Color(0x3027ccc4),
                      thumbColor: aqua,
                      thumbShape:
                      RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                      RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                  space,
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
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
                Calculate res = Calculate(
                  height: height,
                  weight: weight,
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OutputPage(
                      bmi: res.calculation(),
                      resultText: res.result(),
                      suggestionText: res.suggestion(),
                    ),
                  ),
                );
              },
              child: Text(
                'CALCULATE',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  color: white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
