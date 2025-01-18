

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab2and3/models/joke_type_model.dart';

import '../models/joke_model.dart';
import '../services/api_services.dart';
import '../widgets/details/detail_data.dart';
import '../widgets/details/detail_title.dart';

class JokeListScreen extends StatefulWidget {
  const JokeListScreen({super.key});

  @override
  _JokeListScreenState createState() => _JokeListScreenState();
}

class _JokeListScreenState extends State<JokeListScreen> {
  Type type = Type(jokes: []);
  String t = '';

  void getJokes(String t) async {
    ApiService.fetchJokesByType(t).then((response){
      print("response: $response");
      setState(() {
        type= Type(
          type: t,
          jokes: List<Joke>.from(response.map((j) => Joke.fromJson(j))),
        );
      });
    }).catchError((error){
      print("Error: $error");
    });
  }

  @override
  void didChangeDependencies(){
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments as JokeType;
    t = arguments.type.toString();
    print("type: $t");
    if(t.isNotEmpty){
      getJokes(t);
    }

  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as JokeType;
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.deepPurple[900]),
          title: Text('Jokes', style: TextStyle(color: Colors.deepPurple[900]),)),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(mainAxisSize: MainAxisSize.min,
        children: [
          DetailTitle(id: arguments.id, type: arguments.type),
          DetailData(id: arguments.id, type: type),

        ],)
      ),
      );
  }
}
