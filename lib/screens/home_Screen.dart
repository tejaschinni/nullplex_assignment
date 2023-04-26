import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/screens/signin_screen.dart';
import 'package:task/screens/signup_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  logout();
                },
                child: const Text("Logut"))
          ],
        ),
      ),
    ));
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.remove("islogin");
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SigninScreen()));
  }
}
