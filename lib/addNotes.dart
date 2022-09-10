import 'package:flutter/material.dart';
import 'package:notes/model/note.dart';

class Addnotes extends StatelessWidget {
  static const routeName = '/addNotes';
  final _formKey = GlobalKey<FormState>();

  // var _nodes = Note(id: 0, title: '', description: '');
  int id = 0;
  String title = '';
  String description = '';

  onSaved() {
    _formKey.currentState!.save();
    print(id);
    print(title);
    print(description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Notes App'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.save),
          ),
        ],
      ),
    );
  }
}
