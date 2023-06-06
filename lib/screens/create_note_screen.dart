import 'package:flutter/material.dart';
import 'package:group_35_notes_app/components/text_form_field_note.dart';
import 'package:group_35_notes_app/controllers/sql_helper.dart';
import 'package:group_35_notes_app/models/note_model.dart';
import 'package:group_35_notes_app/screens/home_screen.dart';
import 'package:group_35_notes_app/utils/navigation_util.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  var titleController = TextEditingController();
  var bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeData.dark().primaryColorDark,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormFieldNote(
              controller: titleController,
              label: "Title",
              maxlines: 1,
              minlines: 1,
            ),
            const SizedBox(height: 20),
            TextFormFieldNote(
              controller: bodyController,
              label: "Body",
              maxlines: 20,
              minlines: 5,
            ),
          ],
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text("New Note"),
      actions: [
        IconButton(
          onPressed: () {
            if (titleController.text.isEmpty || bodyController.text.isEmpty) {
              NavigationUtils.goToAndOff(context, const HomeScreen());
            } else {
              SqlHelper.createNote(NoteModel(
                      title: titleController.text,
                      body: bodyController.text,
                      dateTime: DateTime.now().toString()))
                  .then((value) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Created Successfully")));

                NavigationUtils.goToAndOff(context, const HomeScreen());
              });
            }
          },
          icon: const Icon(Icons.check),
        ),
      ],
    );
  }
}
