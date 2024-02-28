import 'package:flutter/material.dart';
import 'package:noteapp_project/app/auth/login.dart';
import 'package:noteapp_project/app/auth/registerpage.dart';
import 'package:noteapp_project/app/screens/homeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
late  SharedPreferences sharedPre;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   sharedPre = await SharedPreferences.getInstance(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "php project with rest api",
      initialRoute:sharedPre.getString('id')==null? "/Login":"/Home",
      routes: {
        "/Login": (context) => LoginPage(),
        "/Home": (context) => const HomeScreen(),
        "/Register": (context) => RegisterPage(),
      },
    );
  }
}
