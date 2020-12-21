import 'package:bola_bola/app/constants.dart';
import 'package:bola_bola/views/news/news_page.dart';
import 'package:bola_bola/views/quiz/quiz_page.dart';
import 'package:bola_bola/views/search/search_bar.dart';
import 'package:bola_bola/views/webview_page.dart';
import 'package:flutter/material.dart';

class BolaBola extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bola-Bola Li',
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
  String amaedola = '';
  String bgImage = '';

  @override
  void initState() {
    amaedola = getAmaedola();
    bgImage = getBackgroundImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/$bgImage'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent.withAlpha(65),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 4.0,
          title: Text(
            'Bola-bola Li',
            style: TextStyle(
                fontFamily: 'CinzelDecorative',
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontSize: 24.0),
          ),
          actions: [
            IconButton(
              // tooltip: 'Alui',
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: SearchBar());
              },
            ),
          ],
        ),
        drawer: drawer(),
        body: body(),
      ),
    );
  }

  body() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 4.0),
          child: FlatButton(
            onPressed: () {
              setState(() {
                amaedola = getAmaedola();
                bgImage = getBackgroundImage();
              });
            },
            child: Row(
              children: [
                Text(
                  '\u201c',
                  style: TextStyle(
                      fontFamily: 'LibreBaskerville',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 52.0),
                ),
                SizedBox(
                  width: 16.0,
                ),
                Flexible(
                  child: Container(
                    child: Text(
                      amaedola,
                      style: TextStyle(
                          fontFamily: 'LibreBaskerville',
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 32.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Spacer(),
        Text(
          'mama\'anö Li Niha ba gu\'ö',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
        Text(
          'dokumentasi, standardisasi, promosi',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        SizedBox(height: 12.0),
        Text(
          'foto moroi ba pixabay.com',
          style: TextStyle(color: Colors.white, fontSize: 12.0),
        ),
        SizedBox(height: 12.0),
      ],
    );
  }

  drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/images/$bgImage'),
              ),
            ),
            child: Stack(children: [
              Positioned(
                bottom: 12.0,
                left: 12.0,
                child: Text(
                  'Bola-bola Li',
                  style: TextStyle(
                      fontFamily: 'CinzelDecorative',
                      fontWeight: FontWeight.w700,
                      fontSize: 24.0,
                      color: Colors.white),
                ),
              ),
            ]),
          ),
          ListTile(
            leading: Icon(Icons.home_outlined),
            title: Text('Olayama'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => WebViewPage(
                    title: 'Olayama',
                    selectedUrl:
                        'https://incubator.wikimedia.org/wiki/Wt/nia/Olayama',
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.wb_incandescent_outlined),
            title: Text('Dahö-dahö'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (BuildContext context) => QuizPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.campaign_outlined),
            title: Text('Turia'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (BuildContext context) => NewsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setelan'),
            onTap: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(builder: (BuildContext context) => SettingsPage()),
              // );
            },
          ),
        ],
      ),
    );
  }
}
