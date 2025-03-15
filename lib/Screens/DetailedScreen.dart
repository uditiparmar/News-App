import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/Screens/WebViewScreen.dart';

class DetailedScreen extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String author;
  final String publishedAt;
  final String description;
  final String content;
  final String url;

  const DetailedScreen(
      {super.key,
      required this.description,
      required this.title,
      required this.author,
      required this.content,
      required this.imageUrl,
      required this.publishedAt,
        required this.url
      });
  void _openWebView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => WebViewScreen(url: url)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        margin: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              InkWell(
                onTap: (){Navigator.of(context).pop();},
                  child: const Icon(Icons.arrow_back_ios_new)),
              const SizedBox(height: 10,),
              Text(title,style: GoogleFonts.playfairDisplay(fontSize: 30,fontWeight: FontWeight.bold,height: 1),),
              const SizedBox(height: 15,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                SizedBox(width: 140,child: Text(author,maxLines: 2,style: const TextStyle(fontSize: 20,decoration: TextDecoration.underline),)),
                Text(publishedAt,style: const TextStyle(fontSize: 20)),
              ],),
              const SizedBox(width: 50,),
              Container(
                margin: const EdgeInsets.only(top: 20,bottom: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(imageUrl,),
                ),
              ),
              const SizedBox(width: 20,),
              Text(description,style: GoogleFonts.roboto(fontSize: 20,color: Colors.blue),),
              Text(content,style: GoogleFonts.roboto(fontSize: 20,),),
              TextButton(style: const ButtonStyle(padding: WidgetStatePropertyAll(EdgeInsets.all(2))),onPressed: ()=>_openWebView(context), child: const Text("Read more...",style: TextStyle(fontSize: 18),))

            ],
          ),
        ),
      ),
    );
  }
}

