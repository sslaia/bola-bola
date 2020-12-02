import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/webfeed.dart';

// Source: https://medium.com/@scottingram.scott/hacker-news-rss-app-in-flutter-976728b09361

class NewsPage extends StatefulWidget {
  NewsPage() : super();

  final String title = 'From BBC Indonesia';

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  static const String BBC_URL = 'https://feeds.bbci.co.uk/indonesia/rss.xml';
  RssFeed _feed;
  String _title;

  static const String loadingMessage = 'Loading Feed...';
  static const String feedLoadErrorMessage = 'Error Loading Feed.';
  static const String feedOpenErrorMessage = 'Error Opening Feed.';

  GlobalKey<RefreshIndicatorState> _refreshKey;

  updateTitle(title) {
    setState(() {
      _title = title;
    });
  }

  updateFeed(feed) {
    setState(() {
      _feed = feed;
    });
  }

  Future<void> openFeed(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: false,
      );
      return;
    }
    updateTitle(feedOpenErrorMessage);
  }

  load() async {
    updateTitle(loadingMessage);
    loadFeed().then((result) {
      if (null == result || result.toString().isEmpty) {
        updateTitle(feedLoadErrorMessage);
        return;
      }
      updateFeed(result);
      updateTitle('BBC Indonesia');
    });
  }

  Future<RssFeed> loadFeed() async {
    try {
      final client = http.Client();
      final response = await client.get(BBC_URL);
      return RssFeed.parse(response.body);
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    _refreshKey = GlobalKey<RefreshIndicatorState>();
    updateTitle(widget.title);
    load();
  }

  isFeedEmpty() {
    return null == _feed || null == _feed.items;
  }

  body() {
    return isFeedEmpty()
        ? Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
            key: _refreshKey,
            child: list(),
            onRefresh: () => load(),
          );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: Text(_title),
          backgroundColor: Colors.red[900],
        ),
        body: body(),
      ),
    );
  }

  list() {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Expanded(
        flex: 1,
        child: Container(
          child: ListView.builder(
            padding: EdgeInsets.all(5.0),
            itemCount: _feed.items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = _feed.items[index];
              String targetUrl = item.link;
              return Card(
                elevation: 4.0,
                margin: EdgeInsets.only(
                  bottom: 4.0,
                ),
                child: ListTile(
                  title: title(item.title),
                  subtitle: subtitle(item.pubDate.toString().substring(0, 10)),
                  trailing: rightIcon(),
                  contentPadding: EdgeInsets.all(5.0),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return WebviewScaffold(
                          url: 'https://' +
                              targetUrl.substring(6, targetUrl.length),
                          appBar: AppBar(
                            backgroundColor: Colors.red[900],
                            title: Text('BBC Indonesia'),
                          ),
                          withZoom: true,
                          withLocalStorage: true,
                          hidden: true,
                          initialChild: Container(
                            color: Colors.white,
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
          ),
        ),
      ),
    ]);
  }

// Method that returns the Text Widget for the title of our RSS data.
  title(title) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 18.0, fontWeight: FontWeight.w500, color: Colors.black),
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }

// Method that returns the Text Widget for the subtitle of our RSS data.
  subtitle(subTitle) {
    return Text(
      subTitle,
      style: TextStyle(
          fontSize: 15.0, fontWeight: FontWeight.w300, color: Colors.red[900]),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

// Method that returns Icon Widget.
  rightIcon() {
    return Icon(
      Icons.keyboard_arrow_right,
      color: Colors.red[900],
      size: 30.0,
    );
  }

// Custom box decoration for the Container Widgets.
  BoxDecoration customBoxDecoration() {
    return BoxDecoration(
      border: Border.all(
        color: Colors.indigo, // border color
        width: 1.0,
      ),
    );
  }
}
