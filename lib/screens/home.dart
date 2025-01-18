// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:lab2and3/models/joke_type_model.dart';
// import 'package:lab2and3/screens/random_joke_screen.dart';
// import '../services/api_services.dart';
// import '../widgets/joke/joke_grid.dart';
//
// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }
//
// class _MainScreenState extends State<MainScreen> {
//   List<JokeType> jokeTypes = [];
//
//   @override
//   void initState() {
//     super.initState();
//     getJokeTypesFromAPI();
//   }
//
//   void getJokeTypesFromAPI() async {
//     ApiService.fetchJokeTypes().then((response) {
//       var data = List.from(json.decode(response.body));
//       setState(() {
//         jokeTypes = data.asMap().entries.map<JokeType>((element) {
//           return JokeType(id: element.key+1, type: element.value);
//         }).toList();
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(iconTheme: IconThemeData(color: Colors.deepPurple[900]),
//       backgroundColor: Colors.deepOrange[100],
//           title: Text('Joke Types', style: TextStyle(color: Colors.deepPurple[900]),),
//         actions: [IconButton(onPressed: () {
//           Navigator.push(context, MaterialPageRoute(builder: (context)=> const RandomJokeScreen()));
//         }, icon: Icon(Icons.cake_rounded, color: Colors.deepPurple[900],)),
//         ]),
//       body: JokeGrid(jokeTypes: jokeTypes),
//       );
//   }
// }
