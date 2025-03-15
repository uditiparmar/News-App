import 'package:flutter/material.dart';
import 'package:news_app/Component/TextFormFieldWidget.dart';
import 'package:news_app/Screens/login.dart';
import 'package:news_app/Services/auth_services.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.network(height: 250,
                "https://cdn-icons-png.flaticon.com/512/741/741867.png"),
            const SizedBox(
              height: 50,
            ),
            TextFormFieldWidget(
              textEditingController: nameController,
              hintText: "Name",
              icon: Icons.person,
              isPass: false,
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormFieldWidget(
              textEditingController: emailController,
              hintText: "Email",
              icon: Icons.email,
              isPass: false,
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormFieldWidget(
              textEditingController: passwordController,
              hintText: "Password",
              icon: Icons.lock,
              isPass: true,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                AuthService().signUp(emailController.text, passwordController.text, context);
                // authService.signUp(emailController.text.trim(),
                //     passwordController.text.trim(), context);
              },
              child: Text(
                "SignUp",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.black),
                padding: WidgetStatePropertyAll(
                  EdgeInsets.only(left: 100, right: 100, top: 20, bottom: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account?",
                  style: TextStyle(fontSize: 18),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                    child: const Text("Login",
                        style: TextStyle(fontSize: 18, color: Colors.blue)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
