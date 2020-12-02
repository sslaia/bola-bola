import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;

final Set<JavascriptChannel> jsChannels = [
  JavascriptChannel(
      name: 'Print',
      onMessageReceived: (JavascriptMessage message) {
        print(message.message);
      }),
].toSet();

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
      appBar: AppBar(
        title: Text(title),
      ),
      backgroundColor: Colors.white,
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
              style: TextStyle(color: Colors.indigo),
            ),
            subtitle: Text(wikipages[index].snippet),
            trailing: Icon(
              Icons.favorite,
              color: Colors.redAccent,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return WebviewScaffold(
                    url: 'https://incubator.wikimedia.org/wiki/$wikiTitle',
                    appBar: AppBar(
                      title: Text(title),
                    ),
                    withZoom: true,
                    withLocalStorage: true,
                    hidden: true,
                    initialChild: Container(
                      color: Colors.grey,
                      child: Center(
                        child: Text('Loading...'),
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        );
      },
    );
  }
}
