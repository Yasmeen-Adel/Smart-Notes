import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/bottom_sheet_widget.dart';
import 'package:notes_app/widgets/note_item_wiget.dart';
import 'package:notes_app/widgets/note_list_view.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text('Smart Notes',
                style: TextStyle(fontSize: 30, color: Colors.black)),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(Icons.search, size: 30, color: Colors.black),
                ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 240, 240, 240),
          onPressed: () {
            showModalBottomSheet(
                // isScrollControlled: true,
                context: context,
                builder: (context) {
                  return BottomSheetWidget();
                });
          },
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        body: NoteListView());
  }
}
