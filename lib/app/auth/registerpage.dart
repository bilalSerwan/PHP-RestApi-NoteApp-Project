// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:noteapp_project/app/components/Crud.dart';
import 'package:noteapp_project/app/components/customeTextForm.dart';
import 'package:noteapp_project/app/components/validfuncton.dart';
import 'package:noteapp_project/constant/links.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final Crud _crud = Crud();

  final GlobalKey<FormState> formkey = GlobalKey();

  final TextEditingController username_con = TextEditingController();

  final TextEditingController email_con = TextEditingController();

  final TextEditingController password_con = TextEditingController();

  bool _isloading = false;

  @override
  Widget build(BuildContext context) {
      signUp() async {   
         if (formkey.currentState!.validate()) {
        _isloading = true;
        setState(() {});
        var response = await _crud.postRequest(linkSignUp, {
          "username": username_con.text,
          "email": email_con.text,
          "password": password_con.text,
        });
        _isloading = false;
        setState(() {});
        if (response['status'] == 'success') {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/Home', (route) => false);
        }
      }
    }

    return Scaffold(
      body: SafeArea(
        child: _isloading == true
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
                              return validInput(val, 3, 30);
                            },
                            hintText: 'Enter The username',
                            controller: username_con),
                        CostoumeTextForm(
                          valid: (val) {
                            return validInput(val, 5, 40);
                          },
                          hintText: 'Enter The Email',
                          controller: email_con,
                        ),
                        CostoumeTextForm(
                          valid: (val) {
                            return validInput(val, 3, 15);
                          },
                          hintText: 'Enter The password',
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
                              await signUp();
                            },
                            child: const Text('Sign UP'),
                          ),
                        ),
                        //sign In button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('If you have account'),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/Login');
                              },
                              child: const Text(
                                'Sign In',
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
