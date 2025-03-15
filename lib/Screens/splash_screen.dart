import 'package:flutter/material.dart';
import 'package:news_app/Screens/signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [ Colors.black,Color.fromARGB(255, 10, 33, 92),],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          ),
        ),
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: Image.network(
                "https://cdn-icons-png.flaticon.com/512/21/21601.png",color: Colors.white,
                //fit: BoxFit.fill,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Positioned(
              bottom: 50,
              left: 45,
              right: 45,
              child: ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.white),
                  padding: WidgetStatePropertyAll(
                    EdgeInsets.only(left: 80, right: 80, top: 10, bottom: 10),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SignUp(),
                    ),
                  );
                },
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
