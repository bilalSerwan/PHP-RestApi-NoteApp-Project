import 'package:flutter/material.dart';
import 'package:noteapp_project/app/components/Crud.dart';
import 'package:noteapp_project/app/screens/addingNoteScreen.dart';
import 'package:noteapp_project/constant/links.dart';
import 'package:noteapp_project/main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('start getdata method ================================');
    getdata();
    print('end get data method ==========================================');
  }

  var notes = [];
  final Crud _crud = Crud();
  getdata() async {
    var response = await _crud.getRequest(veiwlink);
    print('response = $response');
    if (response['status'] == "seccess") {
      setState(() {
        notes = response['data'];
        print('notes = $notes');
      });
    } else {
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              sharedPre.clear();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/Login', (route) => false);
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
        title: const Text('Note App'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: IconButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const addingNoteScreen()));
          },
          icon: const Icon(Icons.add),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (int i = 0; i < notes.length; i++)
                InkWell(
                  onTap: () {},
                  child: Card(
                    elevation: 3,
                    shadowColor: Colors.grey,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image.asset(
                            'images/note.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: ListTile(
                            title: Text("${notes[i]['note_title']}"),
                            subtitle: Text("${notes[i]['note_content']}"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
