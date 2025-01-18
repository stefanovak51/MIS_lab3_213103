class JokeType {
  int id;
  String type;

  JokeType({required this.id, required this.type});

  JokeType.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        type = data['type'];


  Map<String, dynamic> toJson() => {'id' : id, 'type' : type};
}