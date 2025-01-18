import 'package:flutter/material.dart';
import 'package:lab2and3/providers/joke_provider.dart';
import 'package:provider/provider.dart';

import '../models/joke_model.dart';

class JokeItem extends StatefulWidget {

  const JokeItem({super.key, required this.joke});

  final Joke joke;

  @override
  State<JokeItem> createState() => _JokeItemState();
}

class _JokeItemState extends State<JokeItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.deepPurple,
      elevation: 5,
      color: Colors.deepOrange[100],
      child: Stack(
        alignment: const Alignment(0,1),
        children: [
          Padding(
              padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(widget.joke.setup,textAlign: TextAlign.center, style: TextStyle(fontSize: 18,color: Colors.deepPurple[900]),),
              Text(widget.joke.punchline,textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.blueAccent[800]),)
            ],
          ),),
          Align(
            heightFactor: 2.8,
            alignment: Alignment.topRight,
            child: IconButton(onPressed: () {
              context.read<JokeProvider>().toggleFavorite(widget.joke);
            },color: widget.joke.isFavorite ? Colors.deepPurple[900] : Colors.deepPurple[100],
                icon: const Icon(Icons.favorite)),
          )
        ],
      ),
    );
  }
}