import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Services/auth_services.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> resetPassword() async{
    try{
      await _auth.sendPasswordResetEmail(email: emailController.text);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password reset email sent! Check your inbox")));
    }
    catch (e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: ${e.toString()}")));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Find your account.",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Enter your email address",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text("You may receive message on your gmail"),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.black),
                      padding: WidgetStatePropertyAll(EdgeInsets.only(
                          left: 100, right: 100, top: 10, bottom: 10))),
                  onPressed: resetPassword,
                  child: const Text(
                    "Reset",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
