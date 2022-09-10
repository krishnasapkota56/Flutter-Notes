import 'package:flutter/material.dart';
import 'package:notes/addNotes.dart';
import 'package:notes/model/note.dart';
import 'package:notes/views/widgets/notesView.dart';

final _formKey = GlobalKey<FormState>();

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Note> _notes = [
    Note(id: 1, title: 'Demo', description: 'This is demo'),
    Note(id: 2, title: 'Demo 2', description: 'This is demo 2'),
    Note(id: 3, title: 'Demo 3', description: 'This is demo 3'),
  ];

  int id = 0;

  String title = '';

  String description = '';

  get notes => null;

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
            onPressed: () {
              Navigator.of(context).pushNamed(Addnotes.routeName);
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: _notes.length == 0
          ? Center(
              child: Text('No notes yet!!'),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Insert Id',
                                labelText: 'ID',
                              ),
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                id = int.parse(value);
                              },
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Insert Title',
                                labelText: 'Title',
                              ),
                              onChanged: (value) {
                                title = value.toString();
                              },
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Insert Description',
                                labelText: 'Description',
                              ),
                              onChanged: (value) {
                                description = value.toString();
                              },
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.deepOrange,
                                ),
                                onPressed: () {
                                  _formKey.currentState!.save();
                                  setState(() {
                                    _notes.add(
                                      Note(
                                          id: id,
                                          title: title,
                                          description: description),
                                    );
                                  });
                                },
                                child: Text('Save Note'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemBuilder: (ctx, i) => NotesView(
                        title: _notes[i].title,
                        description: _notes[i].description,
                      ),
                      itemCount: _notes.length,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
