// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:noteapp_project/app/components/Crud.dart';
import 'package:noteapp_project/app/components/customeTextForm.dart';
import 'package:noteapp_project/app/components/validfuncton.dart';
import 'package:noteapp_project/constant/links.dart';
import 'package:noteapp_project/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formkey = GlobalKey();

  final TextEditingController email_con = TextEditingController();

  final TextEditingController password_con = TextEditingController();

  final Crud _crud = Crud();

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    Login() async {
      if (formkey.currentState!.validate()) {
        try {
          isloading = true;
          setState(() {});
          var response = await _crud.postRequest(linkLogIn, {
            'email': email_con.text,
            'password': password_con.text,
          });
          isloading = false;
          setState(() {});
          if (response['status'] == 'success') {
            sharedPre.setString("id", response['data']['user_id'].toString());
            sharedPre.setString("username", response['data']['username']);
            sharedPre.setString("email", response['data']['email']);
            Navigator.pushNamedAndRemoveUntil(
                context, '/Home', (routs) => false);
          } else {
            showDialog(
              context: context,
              builder: (context) {
                return Center(
                  child: Container(
                    width: 250,
                    height: 200,
                    color: Colors.white70,
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Your Password OR Email is incorrect',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontStyle: FontStyle.normal),
                          textAlign: TextAlign.center,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        } catch (e) {
          print(e);
        }
      }
    }

    return Scaffold(
      body: SafeArea(
        child: isloading == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                child: SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        const Image(
                            image: AssetImage('images/note.png'),
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover),
                        CostoumeTextForm(
                          valid: (val) {
                            return validInput(val, 5, 40);
                          },
                          hintText: 'Enter The  Email',
                          controller: email_con,
                        ),
                        CostoumeTextForm(
                          valid: (val) {
                            return validInput(val, 3, 15);
                          },
                          hintText: 'Enter password',
                          controller: password_con,
                        ),
                        SizedBox(
                          width: 100,
                          height: 40,
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              await Login();
                            },
                            child: const Text('Login'),
                          ),
                        ),
                        //sign Up button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('If you don\'t have account '),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/Register');
                              },
                              child: const Text(
                                'Sing Up',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
