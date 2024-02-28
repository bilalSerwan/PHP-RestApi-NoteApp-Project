// ignore_for_file: camel_case_types, non_constant_identifier_names, file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noteapp_project/app/components/Crud.dart';
import 'package:noteapp_project/app/components/customeTextForm.dart';
import 'package:noteapp_project/app/components/validfuncton.dart';
import 'package:noteapp_project/constant/links.dart';
import 'package:noteapp_project/main.dart';

class addingNoteScreen extends StatefulWidget {
  const addingNoteScreen({super.key});

  @override
  State<addingNoteScreen> createState() => _addingNoteScreenState();
}

class _addingNoteScreenState extends State<addingNoteScreen> {
  final TextEditingController _title_con = TextEditingController();
  final TextEditingController _content_con = TextEditingController();
  final Crud _crud = Crud();
  File? file;
  addNote() async {
    if (file == null) {
      return const AlertDialog(
        title: Text('Error'),
        content: Text('Please Choose Image'),
      );
    }
    await _crud.filesendrequest(
      addlink,
      {
        'note_user_id': sharedPre.getString('id'),
        'note_title': _title_con.text,
        'note_content': _title_con.text,
      },
      file!,
    );
    print('response of add note = =========================');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Note'),
        centerTitle: true,
      ),
      body: SizedBox(
        child: ListView(
          children: [
            CostoumeTextForm(
              controller: _title_con,
              hintText: 'Title',
              valid: (value) {
                return validInput(value, 4, 30);
              },
            ),
            CostoumeTextForm(
              controller: _content_con,
              hintText: 'Content',
              valid: (value) {
                return validInput(value, 0, 100);
              },
            ),
            ElevatedButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: ((context) {
                    return SizedBox(
                      width: 200,
                      height: 200,
                      child: Column(
                        children: [
                          const Text('Choose Image'),
                          TextButton(
                            onPressed: () async {
                              XFile? image = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              file = File(image!.path);
                            },
                            child: const Text('From gallary'),
                          ),
                          TextButton(
                            onPressed: () async {
                              XFile? image = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              file = File(image!.path);
                            },
                            child: const Text('From Camera'),
                          ),
                        ],
                      ),
                    );
                  }),
                );
              },
              child: const Text('choose image'),
            ),
            ElevatedButton(
              onPressed: () async {
                await addNote();
                print('^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^');
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/Home', (route) => false);
              },
              child: const Text('Add Note'),
            ),
          ],
        ),
      ),
    );
  }
}
