import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String apiUrl =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=a83885ebf54345f785d4b20d0cc4c201";

  Future<List<String>> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List articles = data['articles'];

      List<String> sourceNames = articles
          .map((article) => article['source']['name'].toString())
          .toList();
      return sourceNames;
    } else {
      throw Exception("Failed to load");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Publishers",
          style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
        ),
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Error Loading"),
            );
          } else {
            List<String> articles = snapshot.data ?? [];
            return Expanded(
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return Container(
                    margin: const EdgeInsets.all(12),
                    height: 90,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(radius: 30,backgroundImage: NetworkImage('https://logopond.com/logos/c663a1b74ffe4b4f5bbc6d3a338e181a.png'),),
                            const SizedBox(width: 20,),
                            Text(articles[index],style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                          ],
                        ),
                        const Divider(indent: 15,endIndent: 15,),
                        const SizedBox(height: 10,)
                      ],
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
