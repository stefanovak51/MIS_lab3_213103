import 'package:flutter/material.dart';
import 'package:lab2and3/models/joke_type_model.dart';
import 'joke_card.dart';

class JokeGrid extends StatefulWidget {
  final List<JokeType> jokeTypes;

  const JokeGrid({super.key, required this.jokeTypes});

  @override
  State<JokeGrid> createState() => _JokeGridState();
}

class _JokeGridState extends State<JokeGrid> {
  @override
  Widget build(BuildContext context) {
  return GridView.count(
  padding: const EdgeInsets.all(20),
  crossAxisCount: 2,
  crossAxisSpacing: 4,
  mainAxisSpacing: 20,
  semanticChildCount: 250,
  shrinkWrap: true,
  children: widget.jokeTypes.map((jokeType) =>
      JokeCard(type: jokeType.type)).toList());
  }
}



