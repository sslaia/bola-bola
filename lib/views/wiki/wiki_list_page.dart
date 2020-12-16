import 'dart:async';
import 'dart:convert';

import 'package:bola_bola/views/wiki/detail_page.dart';
import 'package:bola_bola/views/wiki/edit_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

// Fetch the latest entries in the wiktionary
Future<List<WikiPages>> fetchWikiPages(http.Client client) async {
  final response = await client.get(
      'https://incubator.wikimedia.org/w/api.php?action=query&format=json&list=search&srsearch=Wt/nia/&srlimit=25&srsort=create_timestamp_desc');

  // Use the compute function to run parseWikiPages in a separate isolate.
  return compute(parseWikiPages, response.body);
}

// A function that converts a response body into a List<WikiPages>.
List<WikiPages> parseWikiPages(String responseBody) {
  final parsed =
      json.decode(responseBody)['query']['search'].cast<Map<String, dynamic>>();
  return parsed.map<WikiPages>((json) => WikiPages.fromJson(json)).toList();
}

class WikiPages {
  final String title;
  final int pageid;
  final String snippet;

  WikiPages({this.title, this.pageid, this.snippet});

  factory WikiPages.fromJson(Map<String, dynamic> json) {
    return WikiPages(
      title: json['title'] as String,
      pageid: json['pageid'] as int,
      snippet: json['snippet'] as String,
    );
  }
}

class WikiListPage extends StatelessWidget {
  final String title;

  WikiListPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.0),
          child: FutureBuilder<List<WikiPages>>(
            future: fetchWikiPages(http.Client()),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? WikiPagesList(wikipages: snapshot.data)
                  : Center(
                      child: CircularProgressIndicator(),
                    );
            },
          ),
        ),
      ),
    );
  }
}

class WikiPagesList extends StatelessWidget {
  final List<WikiPages> wikipages;

  WikiPagesList({Key key, this.wikipages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: wikipages.length,
      itemBuilder: (context, index) {
        String wikiTitle = wikipages[index].title;
        String title = wikipages[index].title.substring(7, wikiTitle.length);
        return Card(
          elevation: 16.0,
          child: ListTile(
            title: Text(
              title,
              style: GoogleFonts.libreBaskerville(
                textStyle: TextStyle(
                    color: Colors.indigoAccent,
                    fontWeight: FontWeight.w400,
                    fontSize: 18.0),
              ),
            ),
            subtitle: Text(
              inlineHtmlWrap(wikipages[index].snippet),
              style: GoogleFonts.libreBaskerville(
                textStyle: TextStyle(
                    color: Colors.black54,
                    fontStyle: FontStyle.italic,
                    // fontWeight: FontWeight.w600,
                    fontSize: 14.0),
              ),
            ),
            // Long press on the item to edit it
            onLongPress: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => EditPage(
                    title: title,
                    selectedUrl:
                        'https://id.wiktionary.org/api/rest_v1/page/mobile-sections/masker?redirect=false',
                  ),
                ),
              );
            },
            // Tap on the item to view the whole page
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => DetailPage(
                    title: title,
                    selectedUrl:
                        'https://incubator.wikimedia.org/wiki/Wt/nia/$title',
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  String inlineHtmlWrap(String htmlStr) {
    return htmlStr.replaceAll(new RegExp("</?span[^>]*>"), '');
  }
}
