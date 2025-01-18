import 'package:flutter/material.dart';
import 'package:lab2and3/providers/joke_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/joke_item.dart';

class FavoriteJokes extends StatelessWidget {
  const FavoriteJokes({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<JokeProvider>().joke.where(
        (j) => j.isFavorite,
    );

    return favorites.isEmpty
        ? const Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.heart_broken),
          SizedBox(
            height: 100,
          ),
          Text("No favorites yet."),
        ],
      ),
    )
        : GridView.count(crossAxisCount: 1,
    childAspectRatio: 2.4,
    mainAxisSpacing: 1,
    crossAxisSpacing: 1,
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
    children: favorites.map(
        (joke){
          return JokeItem(
            joke: joke,
          );
        },
    ).toList(),);
  }
}