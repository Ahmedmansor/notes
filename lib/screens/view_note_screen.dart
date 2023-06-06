import 'package:flutter/material.dart';
import 'package:group_35_notes_app/models/note_model.dart';

class ViewNoteScreen extends StatefulWidget {
  ViewNoteScreen({super.key, this.item});

  NoteModel? item;

  @override
  State<ViewNoteScreen> createState() => _ViewNoteScreenState();
}

class _ViewNoteScreenState extends State<ViewNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Text(
          widget.item!.body!,
          style: const TextStyle(
            fontFamily: "sigmar",
            height: 2,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text(
        widget.item!.title!,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontFamily: "sigmar",
        ),
      ),
    );
  }
}
