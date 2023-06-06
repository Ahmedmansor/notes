import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:group_35_notes_app/components/item_note_home.dart';
import 'package:group_35_notes_app/controllers/sql_helper.dart';
import 'package:group_35_notes_app/models/note_model.dart';
import 'package:group_35_notes_app/screens/create_note_screen.dart';
import 'package:group_35_notes_app/screens/view_note_screen.dart';
import 'package:group_35_notes_app/utils/navigation_util.dart';
import 'package:page_transition/page_transition.dart';

import '../utils/app_settings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    _getData();
    super.initState();
  }

  List<NoteModel> notes = [];

  _getData() async {
    notes = await SqlHelper.getAllNotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeData.dark().primaryColorDark,
      appBar: AppBar(
        title: const Text(
          "Notes App",
          style: TextStyle(fontFamily: "sigmar"),
        ),
      ),
      body: Column(
        children: [
          _buildHeader(),
          notes.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.note, size: 100),
                      Text("No items",
                          style: TextStyle(fontFamily: "sigmar", fontSize: 50)),
                    ],
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        NavigationUtils.goTo(
                            context, ViewNoteScreen(item: notes[index]));
                      },
                      child: ItemNoteHome(
                        note: notes[index],
                      ),
                    );
                  },
                  itemCount: notes.length,
                ))
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${DateTime.now().month} ${DateTime.now().day}, ${DateTime.now().year}",
                style: const TextStyle(
                    fontFamily: "sigmar", fontSize: 25, color: Colors.grey),
              ),
              const Text(
                "Today",
                style: TextStyle(
                  fontFamily: "sigmar",
                  fontSize: 25,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.deepOrange, Colors.orangeAccent],
                )),
            child: MaterialButton(
              onPressed: () {
                NavigationUtils.goToAndOff(context, const CreateNoteScreen());
              },
              child: const Text("Create Note"),
            ),
          )
        ],
      ),
    );
  }
}
