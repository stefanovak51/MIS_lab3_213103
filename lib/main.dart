import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:lab2and3/providers/joke_provider.dart';
import 'package:lab2and3/screens/favorite_joke_screen.dart';
import 'package:lab2and3/screens/list_joke_screen.dart';
import 'package:lab2and3/screens/random_joke_screen.dart';
import 'package:lab2and3/service/joke_service.dart';
import 'package:lab2and3/services/api_services.dart';
import 'package:lab2and3/widgets/joke/joke_grid.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'models/joke_type_model.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<JokeProvider>(
          create: (_) => JokeProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jokes App',
      initialRoute: '/',
      routes: {
        '/' : (context) => MyHomePage(),
        '/details' : (context) => const JokeListScreen(),
        //'/randomJoke': (context) => RandomJokeScreen(),
      },
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});
  final joke = JokeService().getJoke();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPageIndex = 0;
  List<JokeType> jokeTypes = [];
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    getJokeTypesFromAPI();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received message: ${message.notification?.title}');
    });

    _firebaseMessaging.getToken().then((token) {
      print("FCM Token: $token");
    });

  }

  void getJokeTypesFromAPI() async {
    ApiService.fetchJokeTypes().then((response) {
      var data = List.from(json.decode(response.body));
      setState(() {
        jokeTypes = data.asMap().entries.map<JokeType>((element) {
          return JokeType(id: element.key+1, type: element.value);
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoriteCount = context.watch<JokeProvider>()
        .joke
        .where((j) => j.isFavorite)
        .length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[100],
        title: const Text("Jokes app"),
          actions: [IconButton(onPressed: () {
           Navigator.push(context, MaterialPageRoute(builder: (context)=> const RandomJokeScreen()));
         }, icon: Icon(Icons.cake_rounded, color: Colors.deepPurple[900],)),
         ]
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.deepOrange[100],
        onDestinationSelected: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      destinations: [
        const NavigationDestination(icon: Icon(Icons.home), label: 'Jokes'),
        NavigationDestination(icon: Badge(label: Text("$favoriteCount"),
        child: const Icon(Icons.favorite),),
            label: 'Favorite jokes')
      ],
        selectedIndex: currentPageIndex,
      ),
      body: [
        JokeGrid(jokeTypes: jokeTypes),
        const FavoriteJokes(),
      ][currentPageIndex],
    );
  }

}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Background message: ${message.notification?.title}");
}
