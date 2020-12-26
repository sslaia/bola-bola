import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;

// This page is considered a temporary solution
// TODO: perform api request for the content of the page
//        turn json object into a string
//        parse the html/wikitext
//        and show it to the user

Future<WikiSinglePage> fetchWikiSinglePage(String url) async {
  final response = await http.get(url);

  if (response.statusCode == 200) {
    return WikiSinglePage.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load the requested page!');
  }
}

class WikiSinglePage {
  // final String revision;
  // final String lastmodified;
  // final String displaytitle;
  final String text;

  WikiSinglePage({this.text});
  // {this.revision, this.lastmodified, this.displaytitle, this.text});

  factory WikiSinglePage.fromJson(Map<String, dynamic> json) {
    return WikiSinglePage(
      // // revision: json['lead']['revision'],
      // // lastmodified: json['lead']['lastmodified'],
      // // displaytitle: json['lead']['displaytitle'],
      // text: json['remaining']['sections'][0]['text'],
      text: json['sections'][0]['text'],
    );
  }
}

class DetailPage extends StatelessWidget {
  final String title;
  final String selectedUrl;

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
          style: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // TODO: Get the editing request
            },
          ),
        ],
      ),
      body: FutureBuilder<WikiSinglePage>(
        future: fetchWikiSinglePage(selectedUrl),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Html(
                data: snapshot.data.text,
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
