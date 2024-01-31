import 'package:flutter/material.dart';
import 'package:note_app/models/note.dart';

class EditScreen extends StatefulWidget {
  final Note? note;
  const EditScreen({super.key, this.note});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  @override
  void initState() {
    if (widget.note != null) {
      _titleController = TextEditingController(text: widget.note!.title);
      _contentController = TextEditingController(text: widget.note!.title);
    }
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Container(
                        padding: EdgeInsets.all(0),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey.shade800.withOpacity(.8),
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(Icons.arrow_back_ios_new,
                            color: Colors.white))),
              ],
            ),
            Expanded(
                child: ListView(
              children: [
                TextField(
                  controller: _titleController,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Tytuł',
                      hintStyle:
                          TextStyle(color: Colors.blueGrey, fontSize: 30)),
                ),
                TextField(
                  controller: _contentController,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  maxLines: null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Napisz coś...',
                      hintStyle: TextStyle(
                        color: Colors.blueGrey,
                      )),
                ),
              ],
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(
              context, [_titleController.text, _contentController.text]);
        },
        elevation: 10,
        backgroundColor: Colors.blueGrey.shade800,
        child: Icon(Icons.save, color: Colors.white),
      ),
    );
  }
}
