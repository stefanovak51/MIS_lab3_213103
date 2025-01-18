import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/joke_model.dart';
import '../services/api_services.dart';

class RandomJokeScreen extends StatefulWidget {
  const RandomJokeScreen({super.key});

  @override
  State<RandomJokeScreen> createState() => _RandomJokeScreenState();
}

class _RandomJokeScreenState extends State<RandomJokeScreen> {
  Joke randomJoke = Joke();


  void getRandomJokeFromAPI() async {
    ApiService.fetchRandomJoke().then((response){
      print("response: $response");
      setState(() {
        randomJoke = Joke.fromJson(response);
      });
    }).catchError((error){
      print("Error: $error");
    });
  }

  @override
  void initState() {
    super.initState();
    getRandomJokeFromAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.deepPurple[900]),
        title: Text('Random Joke of the Day', style: TextStyle(color: Colors.deepPurple[900]),),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.deepPurple[900],),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> RandomJokeScreen()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
              children: [
                Card(
                  shadowColor: Colors.deepOrange,
                  color: Colors.deepOrange[100],
                  child: ListTile(
                    title: Text(randomJoke.setup,
                        style:  TextStyle(color: Colors.deepOrange[800], fontSize: 20, fontWeight: FontWeight.w500)),
                    subtitle: Text(randomJoke.punchline,
                        style:  TextStyle(color: Colors.deepPurple[900], fontSize: 18, fontWeight: FontWeight.w500)),
                  ),
                )
              ]
          )
      ),
    );
  }
}
