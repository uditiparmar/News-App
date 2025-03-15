import 'package:flutter/material.dart';
import 'package:news_app/Component/TextFormFieldWidget.dart';
import 'package:news_app/Screens/forgotpassword.dart';
import 'package:news_app/Screens/signup.dart';
import 'package:news_app/Services/auth_services.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
            Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ForgotPasswordScreen()));
                    },
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ))),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: (){
                AuthService().signIn(emailController.text, passwordController.text, context);
              },
              // onPressed: () async {
              //   await authService.signIn(emailController.text.trim(),
              //       passwordController.text.trim(), context);
              // },
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.black),
                  padding: WidgetStatePropertyAll(EdgeInsets.only(
                      left: 100, right: 100, top: 20, bottom: 20))),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Create an account?",
                  style: TextStyle(fontSize: 18),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: const Text("SignUp",
                        style: TextStyle(fontSize: 18, color: Colors.blue)))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
