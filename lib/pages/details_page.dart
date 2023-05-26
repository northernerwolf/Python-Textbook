import 'package:flutter/material.dart';

import 'package:webview_flutter_plus/webview_flutter_plus.dart';

import '../design/widget_styles.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({required this.title, required this.index});

  final String title;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        flexibleSpace: colorfulAppBar,
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 80),
        child: WebViewPlus(
          // initialUrl: "assets/all/$index.html",
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            controller.loadUrl('assets/all/$index.html');
          },
        ),
      ),
    );
  }
}
