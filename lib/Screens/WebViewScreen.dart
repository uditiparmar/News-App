import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  final String url;
  const WebViewScreen({super.key, required this.url});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()..loadRequest(Uri.parse(widget.url));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Full Article"),
        actions: [
          IconButton(onPressed: ()=>_controller.reload, icon: const Icon(Icons.refresh))
        ],
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
