import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/screens/edit_note_screen.dart';

class NoteItemWidget extends StatelessWidget {
  final NoteModel model;
  const NoteItemWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    // final formattedDate =
    //     DateFormat('yyyy-MM-dd – HH:mm').format(DateTime.now());

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditNoteScreen(note: model)));
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        color: const Color.fromARGB(255, 201, 201, 201),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text(
                // 'Note Title',
                model.title,
                style: TextStyle(fontSize: 25, color: Colors.black),
                maxLines: 1,
              ),
              subtitle: Text(
                // 'Note content',
                model.subTitle,
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 50, 50, 50)),
                maxLines: 1,
              ),
              trailing: IconButton(
                onPressed: () {
                  model.delete();
                  BlocProvider.of<NotesCubit>(context).getAllNotes();
                },
                icon: const Icon(Icons.delete, color: Colors.black, size: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0, bottom: 8.0),
              child: Text(
                // formattedDate,
                // DateTime.now().toString(),
                model.date,
                style: const TextStyle(color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
