import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab2and3/models/joke_type_model.dart';
import 'package:lab2and3/widgets/joke/joke_data.dart';


class JokeCard extends StatelessWidget{
  final String type;

  const JokeCard({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurple[200],
        borderRadius: BorderRadius.circular(30)
      ),
      height: 100,
      width: 100,
      child: InkWell(
        radius: 20,
        borderRadius: BorderRadius.circular(100),
        highlightColor: Colors.indigo,
        splashColor: Colors.yellow,
        onTap: () => {
          Navigator.pushNamed(context, '/details',
          arguments: JokeType(type: type, id: 0 ))
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepOrange, width: 5),
            borderRadius: BorderRadius.circular(30)
          ),
          child: JokeData(type: type),
        )
      ),
    );
  }
}