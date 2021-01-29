import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget{
  AddButton({@required this.onPressed});
  final GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomRight,
      child: RawMaterialButton(
        onPressed: onPressed,
        fillColor: Colors.white,
        splashColor: Colors.deepPurple[300],
        shape: const CircleBorder(),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Container(

            child: Icon(
              Icons.add_rounded,
              color: Colors.black,
              size: 35,
            ),
          ),
        ),
      ),
    );
  }
}