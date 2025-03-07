import 'package:flutter/material.dart';
import 'package:gradify/Calculator.dart';
import 'package:gradify/Search.dart';
import 'package:gradify/calendar.dart';
import 'package:gradify/note.dart';
import 'package:gradify/timer.dart';
import 'package:gradify/todolist.dart';
import 'myhomepage.dart';
final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: [routeObserver],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      routes: {
        'MyHomePage': (context) => const MyHomePage(),
        'timer': (context) => const Timer(),
        'Calculator': (context) => const Calculator(),
        'ToDoList': (context) =>  const Todolist(),
        'Note': (context) => const Note(),
        'Calendar': (context) => const Calendar(),
        'Search': (context) => const Search()
      },
    );
  }
}