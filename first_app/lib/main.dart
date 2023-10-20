// import 'package:first_app/list_movies.dart';
import 'package:first_app/my_form.dart';
// import 'package:first_app/my_class_room.dart';
// import 'package:first_app/my_home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Group 02',
      // home: MyHomePage(),
      // home: MyClassroom(),
      // home: MyListMovies(),
      home: MyForm(),
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(fontFamily: 'Gabarito'),
    );
  }
}
