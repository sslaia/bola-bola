import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

// This is only placeholder.
// In this page the app would request a token for editing purpose
// and use that token to fetch the content of the page and the timestamp,
// and perform the post request to save the changes

class EditPage extends StatelessWidget {
  final String title;
  final String selectedUrl;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  EditPage({
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
