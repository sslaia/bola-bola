import 'package:animated_text/animated_text.dart';
import 'package:bola_bola/views/news/news_page.dart';
import 'package:bola_bola/views/quiz/quiz_page.dart';
import 'package:bola_bola/views/wiki/wiki_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class BolaBola extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bola-bola',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Bola-bola Li Niha'),
        actions: [
          IconButton(
            tooltip: 'Alui',
            icon: const Icon(Icons.search),
            onPressed: () {
              // showSearchPage(context, _searchDelegate);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Text(
                'Bola-bola Li Niha',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home_outlined),
              title: Text('Olayama [Main Page]'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return WebviewScaffold(
                      url:
                          'https://incubator.wikimedia.org/wiki/Wt/nia/Olayama',
                      appBar: AppBar(
                        backgroundColor: Colors.indigo,
                        title: Text('Wiktionary Li Niha'),
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
            ListTile(
              leading: Icon(Icons.create_outlined),
              title: Text('Sura [Create]'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => CreatePage()),
                // );
              },
            ),
            ListTile(
              leading: Icon(Icons.list_alt_outlined),
              title: Text('Angolita [Word list]'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WikiListPage(
                            title: 'Recent entries in the dictionary',
                          )),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.wb_incandescent_outlined),
              title: Text('Dahö-dahö [Quiz]'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.campaign_outlined),
              title: Text('Turia [News]'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setelan [Settings]'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SettingsPage()),
                // );
              },
            ),
          ],
        ),
      ),
      body: FlatButton(
        height: 300,
        onPressed: () {
          print('Fetching the word list...');
        },
        child: AnimatedText(
          alignment: Alignment.center,
          speed: Duration(milliseconds: 1000),
          controller: AnimatedTextController.loop,
          displayTime: Duration(milliseconds: 1000),
          wordList: ['abila gae', 'aköi gowi', 'afatö na', 'lafagamöi'],
          textStyle: TextStyle(
              color: Colors.indigo, fontSize: 55, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
