import 'package:flutter/material.dart';
import 'package:lab2and3/main.dart';
import 'package:lab2and3/providers/joke_provider.dart';
import 'package:lab2and3/service/joke_service.dart';
import 'package:lab2and3/widgets/joke_item.dart';
import 'package:provider/provider.dart';
import '../../models/joke_model.dart';

class DetailData extends StatelessWidget {
  final int id;
  final Type type;
  final JokeService _jokeService = JokeService();
  late List<Joke> all_jokes = [];
   DetailData({super.key, required this.id, required this.type});


  @override
  Widget build(BuildContext context) {
    final all_jokes = context.watch<JokeProvider>().joke;
    final jokes = all_jokes.where((joke) => joke.type == type.type).toList();
    return Container(
      padding: EdgeInsets.all(10),
        child: Column(
          children: jokes.map((joke) {
            return JokeItem(joke: joke);
          }).toList(),
        )
    );
  }
}
