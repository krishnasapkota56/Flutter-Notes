import 'package:flutter/material.dart';

class NotesView extends StatelessWidget {
  String title;
  String description;

  NotesView({
    required this.title,
    required this.description,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
      ),
      subtitle: Text(
        description,
      ),
    );
  }
}
