import 'dart:async';
import 'dart:convert';

import 'package:bola_bola/views/wiki/create_page.dart';
import 'package:bola_bola/views/wiki/detail_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

Future<List<WikiPages>> fetchWikiPages(http.Client client, String title) async {
  final String url =
      'https://id.wiktionary.org/w/api.php?action=query&format=json&srlimit=10&srsort=relevance&list=search&srsearch=';

  final response = await client.get(url + title);

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

class SearchBar extends SearchDelegate<String> {
  List<WikiPages> wikipages;
  // String selectedResult;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = '';
        },
      ),
      IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => CreatePage()),
          );
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          // Navigator.pop(context);
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<WikiPages>>(
      future: fetchWikiPages(http.Client(), query),
      builder: (context, snapshot) {
        if (snapshot.hasError) print(snapshot.error);
        return snapshot.hasData
            ? WikiPagesList(wikipages: snapshot.data)
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
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
        String title = wikipages[index].title;
        return Card(
          elevation: 16.0,
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.indigo),
            ),
            subtitle: Text(
              inlineHtmlWrap(wikipages[index].snippet),
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            trailing: Icon(
              Icons.edit,
            ),
            onLongPress: () {
              //TODO: perform api request for editing the page
            },
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => DetailPage(
                    title: title,
                    selectedUrl:
                        'https://id.wiktionary.org/api/rest_v1/page/mobile-sections-remaining/$title',
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
