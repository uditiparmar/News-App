import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/Screens/DetailedScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String apiUrl =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=a83885ebf54345f785d4b20d0cc4c201";

  Future<List<dynamic>> fetchData() async {
    final Data = Uri.parse(apiUrl);
    final response = await http.get(Data);

    if (response.statusCode == 200) {
      final Data = jsonDecode(response.body);
      return Data['articles'];
    } else {
      throw Exception("Failed to load");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(12),
          child: Text(
            "Top Headline",
            style:
                GoogleFonts.playfair(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
        FutureBuilder(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Error loading"),
              );
            } else {
              List<dynamic> articles = snapshot.data ?? [];
              return Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    final article = articles[index];
                    return Container(
                      margin: const EdgeInsets.only(left: 12, right: 12),
                      width: 340,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 220,
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl: article['urlToImage'] ??
                                      "https://via.placeholder.com/150"),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            article['title'] ?? "No Title Available",
                            style: GoogleFonts.playfair(
                                height: 1,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 140,
                                child: Text(
                                  article['author'] ?? "Unknown Author",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.playfair(
                                      fontSize: 18, color: Colors.black),
                                ),
                              ),
                              Text(article['publishedAt']?.toString() ??
                                  "No Date"),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                                 GestureDetector(
                                   onTap: () {
                                     Navigator.of(context).push(
                                       MaterialPageRoute(
                                         builder: (context) => DetailedScreen(
                                           description: article['description']??"No Description",
                                           title: article['title']??"No Title",
                                           author: article['author']??"Unknown Author",
                                           content: article['content']??"No Content",
                                           imageUrl: article['urlToImage']?? "",
                                           publishedAt: article['publishedAt']??"No Date",
                                           url: article['url']??"No url"
                                         ),
                                       ),
                                     );
                                   },
                                   child: const Text(
                                    "Read Now",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 1.5,
                                      decorationColor: Colors.blue,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue
                                    ),
                                                                   ),
                                 ),

                              const Icon(
                                Icons.arrow_forward,
                                size: 15,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
