import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';

class EditNoteScreen extends StatefulWidget {
  final NoteModel note;

  EditNoteScreen({super.key, required this.note});

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  String? title, subTile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          onChanged: (value) => title = value,
          initialValue: widget.note.title,
          style: TextStyle(fontSize: 30),
        ),
        actions: [
          IconButton(
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = subTile ?? widget.note.subTitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).getAllNotes();
                Navigator.pop(context);
              },
              icon: Icon(Icons.check))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Expanded(
            child: TextFormField(
          onChanged: (value) => subTile = value,
          initialValue: widget.note.subTitle,
          maxLines: null,
          expands: true,
          style: TextStyle(fontSize: 25),
        )),
      ),
    );
  }
}
