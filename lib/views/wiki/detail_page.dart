import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

// This page is considered a temporary solution
// TODO: perform api request for the content of the page
//        turn json object into a string
//        parse the html/wikitext
//        and show it to the user

class DetailPage extends StatelessWidget {
  final String title;
  final String selectedUrl;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  DetailPage({
    @required this.title,
    @required this.selectedUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: GoogleFonts.comfortaa(
              textStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
          backgroundColor: Colors.indigo,
        ),
        body: WebView(
          initialUrl: selectedUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ));
  }
}
