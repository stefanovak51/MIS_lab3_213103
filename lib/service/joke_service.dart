import 'package:lab2and3/jokes.dart';
import '../models/joke_model.dart';

class JokeService {
  List<Joke> getJoke() {
    return jokeRawData.map((json) => Joke.fromJson(json)).toList();
  }
}