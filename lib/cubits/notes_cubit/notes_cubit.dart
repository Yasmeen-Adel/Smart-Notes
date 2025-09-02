import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/widgets/constants.dart';

part 'notes_cubit_state.dart';

class NotesCubit extends Cubit<NotesCubitState> {
  NotesCubit() : super(NotesCubitInitial());

  List<NoteModel>? notes;
  getAllNotes() async {
    var notesBox = Hive.box<NoteModel>(notesBoxKey);
    notes = notesBox.values.toList();
    emit(NotesCubitSuccess());
  }
}
