import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FancyButton extends StatelessWidget{
  FancyButton({@required this.onPressed});
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(top: 50),
      child: RawMaterialButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 20.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const <Widget> [
              RotatedBox(
                quarterTurns: 4,
                child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                ),
              ),
              SizedBox(width: 8.0),
              Text("Back",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
              ),
              ),
            ],
          ),
      ),
      ),
    );
  }
}

        /*
      ),
* */