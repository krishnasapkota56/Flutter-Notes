import 'package:flutter/material.dart';
import 'package:notes/addNotes.dart';
import 'package:notes/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var routeName;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Homepage(),
      debugShowCheckedModeBanner: false,
      routes: {Addnotes.routeName: ((context) => Addnotes())},
    );
  }
}
