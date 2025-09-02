import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_text_field.dart';
import 'package:notes_app/widgets/custom_button_widget.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // String? title, subTitle;
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteCubitState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('error!')));
          }
          if (state is AddNoteSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AddNoteLoading,
            child: AddNoteForm(),
          );

          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: SingleChildScrollView(
          //     child: Form(
          //       key: fromKey,
          //       child: Column(
          //         children: [
          //           const SizedBox(height: 20),
          //           CustomTextField(
          //             hint: 'title',
          //             onSaved: (value) => title = value,
          //           ),
          //           const SizedBox(height: 20),
          //           CustomTextField(
          //             hint: 'Enter Your text...',
          //             onSaved: (value) => subTitle = value,
          //             maxLines: 6,
          //           ),
          //           const SizedBox(height: 20),
          //           CustomButtonWidget(
          //             onClick: () {
          //               if (fromKey.currentState!.validate()) {
          //                 fromKey.currentState!.save();
          //                 var dateNow = DateTime.now();
          //                 var formattedDate =
          //                     DateFormat('dd-MM-yyyy').format(dateNow);
          //                 NoteModel noteModel = NoteModel(
          //                   title: title!,
          //                   subTitle: subTitle!,
          //                   date: formattedDate,
          //                   color: const Color.fromARGB(255, 221, 221, 221),
          //                 );
          //               }
          //             },
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // );
        },
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  // final GlobalKey<FormState> fromKey = GlobalKey();
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> fromKey = GlobalKey();
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 10.0,top: 10,bottom: MediaQuery.of(context).viewInsets.bottom,),
      child: SingleChildScrollView(
        child: Form(
          key: fromKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              CustomTextField(
                hint: 'title',
                onSaved: (value) => title = value,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hint: 'Enter Your text...',
                onSaved: (value) => subTitle = value,
                maxLines: 6,
              ),
              const SizedBox(height: 20),
              CustomButtonWidget(
                onClick: () {
                  if (fromKey.currentState!.validate()) {
                    fromKey.currentState!.save();
                    var dateNow = DateTime.now();
                    var formattedDate =
                        DateFormat('dd-MM-yyyy').format(dateNow);
                    NoteModel noteModel = NoteModel(
                      title: title!,
                      subTitle: subTitle!,
                      date: formattedDate,
                      color: const Color.fromARGB(255, 221, 221, 221),
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                    BlocProvider.of<NotesCubit>(context).getAllNotes();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// class BottomSheetWidget extends StatelessWidget {
//   final GlobalKey<FormState> fromKey = GlobalKey();
//   BottomSheetWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     String? title, subTitle;
//     return BlocProvider(
//       create: (context) => AddNoteCubit(),
//       //   child: Container(),

//       // (
//       child: BlocConsumer<AddNoteCubit, AddNoteCubitState>(
//         listener: (context, state) {
//           if (state is AddNoteFailure) {
//             ScaffoldMessenger.of(context)
//                 .showSnackBar(SnackBar(content: Text('error!')));
//           }
//           if (state is AddNoteSuccess) {
//             Navigator.pop(context);
//           }
        
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: SingleChildScrollView(
//             child: Form(
//                 key: fromKey,
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 20,
//                     ),
//                     CustomTextField(
//                       hint: 'title',
//                       onSaved: (value) => title = value,
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     CustomTextField(
//                       hint: 'Enter Your text...',
//                       onSaved: (value) => subTitle = value,
//                       maxLines: 6,
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     CustomButtonWidget(
//                       onClick: () {
//                         if (fromKey.currentState!.validate()) {
//                           fromKey.currentState!.save();
//                           var dateNow = DateTime.now();
//                           var formattedDate =
//                               DateFormat('dd-mm-yyyy').format(dateNow);
//                           NoteModel noteModel = NoteModel(
//                               title: title!,
//                               subTitle: subTitle!,
//                               date: formattedDate,
//                               color: const Color.fromARGB(255, 221, 221, 221));
//                         }
//                       },
//                     )
//                   ],
//                 )),
//           ),
//         ),
//         }
      
//       ),
    
//       // ),
//     );
//   }
// }




// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:notes_app/models/note_model.dart';
// import 'package:notes_app/widgets/custom_text_field.dart';
// import 'package:notes_app/widgets/saved_bottom_widget.dart';
// import 'package:intl/intl.dart';

// class BottomSheetWidget extends StatelessWidget {
//   const BottomSheetWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final formKey = GlobalKey<FormState>();
//     String? title, subTitle;

//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: SingleChildScrollView(
//         child: Form(
//           key: formKey,
//           child: Column(
//             children: [
//               const SizedBox(height: 20),
//               CustomTextField(
//                 hint: 'Title',
//                 onSaved: (value) => title = value,
//                 maxLines: 1,
//               ),
//               const SizedBox(height: 20),
//               CustomTextField(
//                 hint: 'Enter Your text...',
//                 onSaved: (value) => subTitle = value,
//                 maxLines: 5,
//               ),
//               const SizedBox(height: 20),
//               saved_bottom_widget(
//                 onClick: () {
//                   if (formKey.currentState!.validate()) {
//                     formKey.currentState!.save();
//                     var dateNow = DateTime.now();
//                     var formattedDate =
//                         DateFormat('dd-MM-yyyy').format(dateNow);

//                     NoteModel noteModel = NoteModel(
//                       title: title!,
//                       subTitle: subTitle!,
//                       date: formattedDate,
//                       color: Colors.blue,
//                     );


//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// OutlineInputBorder myBorder({Color color = Colors.white}) {
//   return OutlineInputBorder(
//     borderRadius: BorderRadius.circular(10),
//     borderSide: BorderSide(color: color),
//   );
// }