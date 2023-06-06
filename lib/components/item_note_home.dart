import 'package:flutter/material.dart';
import 'package:group_35_notes_app/controllers/sql_helper.dart';
import 'package:group_35_notes_app/models/note_model.dart';
import 'package:group_35_notes_app/screens/edit_note_screen.dart';
import 'package:group_35_notes_app/utils/navigation_util.dart';

import '../utils/app_settings.dart';

class ItemNoteHome extends StatelessWidget {
  ItemNoteHome({super.key, this.note});

  NoteModel? note;

  _showBottomSheet(context) {
    showModalBottomSheet(
      enableDrag: false,
      context: context,
      builder: (context) {
        return Container(
          height: 200,
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 10),
              MaterialButton(
                onPressed: () {
                  NavigationUtils.goTo(
                      context,
                      EditNoteScreen(
                        note: note,
                      ));
                },
                minWidth: AppSettings.width,
                height: 50,
                color: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: const Text("Edit"),
              ),
              const SizedBox(height: 20),
              MaterialButton(
                onPressed: () {
                  SqlHelper.deleteNote(note!.id!);
                },
                minWidth: AppSettings.width,
                height: 50,
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: const Text("Delete"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20),
        width: AppSettings.width,
        height: AppSettings.height * .2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.deepOrange, Colors.orangeAccent],
            )),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      note!.title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style:
                          const TextStyle(fontFamily: "sigmar", fontSize: 17),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        _showBottomSheet(context);
                      },
                      icon: const Icon(Icons.more_horiz))
                ],
              ),
            ),
            const Expanded(
              child: Divider(
                color: Colors.white,
                thickness: .2,
              ),
            ),
            Expanded(
              child: Text(
                note!.body!,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  const Icon(Icons.calendar_month),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(note!.dateTime!),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
