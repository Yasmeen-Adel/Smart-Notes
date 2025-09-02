# 📝 Smart Notes

Smart Notes is a simple and smart note-taking app built with **Flutter**.  
It helps you create, edit, and manage your notes easily with a clean and modern interface.

---

## 🚀 Features
- ✨ Add, edit, and delete notes
- 📂 Organize your notes efficiently
- 🔍 Search and filter notes
- 🌓 Light & dark mode support
- 💾 Local storage using Hive (or Firebase if integrated)
- 📱 Responsive UI (works on Android & iOS)


---

## 🛠️ Tech Stack
- [Flutter](https://flutter.dev/) - UI Framework
- [Dart](https://dart.dev/) - Programming Language
- [Hive](https://pub.dev/packages/hive) - Local Database  
  *(Replace with Firebase if you’re using Firestore/Authentication)*

---

## 📂 Project Structure
lib/
│── main.dart
│── my_bloc_observer.dart
│
├── cubits/
│ ├── add_note_cubit/
│ │ ├── add_note_cubit.dart
│ │ └── add_note_cubit_state.dart
│ │
│ └── notes_cubit/
│ ├── notes_cubit.dart
│ └── notes_cubit_state.dart
│
├── models/
│ ├── note_model.dart
│ └── note_model.g.dart
│
├── screens/
│ ├── edit_note_screen.dart
│ ├── notes_screen.dart
│ └── splash_screen.dart
│
└── widgets/
├── bottom_sheet_widget.dart
├── constants.dart
├── custom_button_widget.dart
├── custom_text_field.dart
├── note_item_widget.dart
└── note_list_view.dart
