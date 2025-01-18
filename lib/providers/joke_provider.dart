import 'package:flutter/cupertino.dart';
import 'package:lab2and3/service/joke_service.dart';

import '../models/joke_model.dart';

class JokeProvider extends ChangeNotifier{
  final _jokeService = JokeService();
  late final List<Joke> joke;

  JokeProvider() {
    joke = _jokeService.getJoke();
  }

  void toggleFavorite(Joke joke) {
    joke.isFavorite = !joke.isFavorite;
    notifyListeners();
  }
}