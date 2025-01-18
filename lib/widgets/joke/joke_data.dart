import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JokeData extends StatelessWidget{
  final String type;

  const JokeData({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        padding: const EdgeInsets.only(top: 50, bottom: 20),
        //color: Colors.indigo,
        height: 100,
        width: 200,
        alignment: const Alignment(0, 1),
        child: Text(type, style: TextStyle(
          color: Colors.deepPurple[900],
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),),
      )
    ],);
  }


}