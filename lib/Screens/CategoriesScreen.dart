import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Screens/DetailedScreen.dart';

class CategoriesScreen extends StatefulWidget {
  CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final String apiKey = "a83885ebf54345f785d4b20d0cc4c201";
  final String baseUrl = "https://newsapi.org/v2/top-headlines?country=us&apiKey=";
  final List<String> categories = [
    "All",
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Science",
    "Sports",
    "Technology"
  ];

  Future<List<dynamic>> fetchData(String category) async {
      String requestUrl = "$baseUrl$apiKey";
    if(category!="All"){
      requestUrl += "&category=${category.toLowerCase()}";
    }
    final response = await http.get(Uri.parse(requestUrl));
    if (response.statusCode == 200) {
      final Data = jsonDecode(response.body);
      return Data['articles'];
    } else {
      throw Exception("Failed to load");
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0.5),
            child: TabBar(
                labelColor: Colors.black,
                indicatorColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: GoogleFonts.lora(color: Colors.grey, fontSize: 20),
                isScrollable: true,
                tabs: categories
                    .map((categories) => Tab(
                          text: categories,
                        ))
                    .toList()),
          ),
        ),
        body: TabBarView(
            children: categories
                .map((categories) => _buildNewsList(categories))
                .toList()),
      ),
    );
  }

  Widget _buildNewsList(String categories) {
    return FutureBuilder(
      future: fetchData(categories),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Text("Error Loading");
        } else {
          List<dynamic> article = snapshot.data!;
          return ListView.builder(
            itemCount: article.length,
            itemBuilder: (context, index) {
              final articles = article[index];
              return Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailedScreen(description: articles['description']??"No Description",
                        title: articles['title']??"No Title",
                        author: articles['author']??"Unknown Author",
                        content: articles['content']??"No Content",
                        imageUrl: articles['urlToImage']?? "",
                        publishedAt: articles['publishedAt']??"No Date",
                      url: articles['url'],)));
                    },
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(15),
                          width: 400,
                          height: 150,
                        ),
                        Positioned(
                          top: 15,
                          left: 10,
                          child: Row(
                            children: [
                              SizedBox(
                                  width: 140,
                                  height: 140,
                                  child: CachedNetworkImage(
                                      fit: BoxFit.fill,
                                      imageUrl: articles['urlToImage'] ?? "")),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    height: 140,
                                    width: 220,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          articles['title'] ?? "No Title",
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 20, fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 25,
                                        ),
                                        Text(articles['author'] ?? "No Author",overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(fontSize: 15))
                                      ],
                                    ),
                                  ),
                                  const Icon(Icons.more_vert,size: 25),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider()
                ],
              );
            },
          );
        }
      },
    );
  }
}
