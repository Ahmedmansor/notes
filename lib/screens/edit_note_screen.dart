import 'package:flutter/material.dart';
import 'package:group_35_notes_app/components/text_form_field_note.dart';
import 'package:group_35_notes_app/models/note_model.dart';
import 'package:group_35_notes_app/utils/navigation_util.dart';

class EditNoteScreen extends StatefulWidget {
  EditNoteScreen({this.note, super.key});

  NoteModel? note;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  var titleController;
  var bodyController;
  @override
  void initState() {
    titleController = TextEditingController(text: widget.note!.title);
    bodyController = TextEditingController(text: widget.note!.body);
    super.initState();
  }

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
      title: const Text("Edit Note"),
      actions: [
        IconButton(
          onPressed: () {
            NavigationUtils.offScreen(context);
          },
          icon: const Icon(Icons.check),
        ),
      ],
    );
  }
}
