import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

const Color grey = Color(0xFF757575);
const Color white = Colors.white;
const Color aqua = Color(0xFF27ccc4);
const label = TextStyle(
  fontSize: 30,
  color: grey,
);

const inputText = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: grey,
);

class GenderWidget extends StatelessWidget {
  GenderWidget(
      {this.press,
      this.icon,
      this.genderName,
      this.backgroundColour,
      this.textColour});

  final Function press;
  final IconData icon;
  final String genderName;
  final Color backgroundColour;
  final Color textColour;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColour,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            Text(
              genderName,
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: textColour,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Icon(
              icon,
              color: textColour,
              size: 35.0,
            ),
          ],
        ),
      ),
    );
  }
}

const space = SizedBox(
  height: 15,
);

class Button extends StatelessWidget {
  Button({@required this.icon, @required this.onPress, this.onLongPress});
  final IconData icon;
  final Function onPress;
  final Function onLongPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      child: Icon(
        icon,
        color: white,
      ),
      onPressed: onPress,
      onLongPress: onLongPress,
      constraints: BoxConstraints(minWidth: 50.0, minHeight: 50.0),
      shape: CircleBorder(),
      fillColor: aqua,
      highlightColor: grey,
    );
  }
}
