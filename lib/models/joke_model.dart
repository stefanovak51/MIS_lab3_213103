import 'dart:convert';

class Joke {
  final String type;
  final String setup;
  final String punchline;
  bool isFavorite = false;

  Joke({ this.type='', this.setup='', this.punchline=''});

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      type: json['type'],
      setup: json['setup'],
      punchline: json['punchline'],
    );
  }
}

Type typeFromJson(String str) => Type.fromJson(json.decode(str));


class Type {
  final List<Joke> jokes;
  final String type;

  Type({
    this.jokes = const [],
    this.type = ''
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
    jokes: List<Joke>.from(json["jokes"].map((j) => Joke.fromJson(j))),
    type: json["type"] ?? '',
  );
}