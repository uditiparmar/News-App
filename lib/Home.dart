import 'package:flutter/material.dart';
import 'package:news_app/Screens/ProfileScreen.dart';
import 'package:news_app/Screens/CategoriesScreen.dart';
import 'package:news_app/Screens/HomeScreen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    CategoriesScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        selectedIndex: _selectedIndex,
         onDestinationSelected: (int index){
          setState(() {
            _selectedIndex = index;
          });
         },
          height: 70,
          destinations: const[
            NavigationDestination(icon: Icon(Icons.home_filled, size: 30,), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.lightbulb_circle, size: 30), label: 'Discover'),
            NavigationDestination(icon: Icon(Icons.account_circle, size: 30,), label: 'Profile')
          ]),
      appBar: _selectedIndex ==0 ?
      AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "New",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            Text(
              "Z",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ):null,
      body: _screens[_selectedIndex]
    );
  }
}
