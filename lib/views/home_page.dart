import 'package:bola_bola/app/constants.dart';
import 'package:bola_bola/views/news/news_page.dart';
import 'package:bola_bola/views/quiz/quiz_page.dart';
import 'package:bola_bola/views/wiki/create_page.dart';
import 'package:bola_bola/views/wiki/detail_page.dart';
import 'package:bola_bola/views/wiki/wiki_list_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            style: GoogleFonts.cinzelDecorative(
              textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0),
            ),
          ),
          actions: [
            IconButton(
              // tooltip: 'Alui',
              icon: const Icon(Icons.search),
              onPressed: () {
                // showSearchPage(context: context, delegate: SearchBar());
              },
            ),
          ],
        ),
        drawer: Drawer(
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
                      style: GoogleFonts.cinzelDecorative(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0),
                      ),
                    ),
                  ),
                ]),
              ),
              ListTile(
                leading: Icon(Icons.home_outlined),
                title: Text(
                  'Olayama',
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.w600),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => DetailPage(
                        title: 'Olayama',
                        selectedUrl:
                            'https://incubator.wikimedia.org/wiki/Wt/nia/Olayama',
                      ),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.create_outlined),
                title: Text(
                  'Sura',
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                        color: Colors.black87,
                        // fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          CreatePage(title: 'Sura entri'),
                    ),
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => CreatePage()),
                  // );
                },
              ),
              ListTile(
                leading: Icon(Icons.list_alt_outlined),
                title: Text(
                  'Angolita',
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                        color: Colors.black87,
                        // fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          WikiListPage(title: 'Entri si bohou'),
                    ),
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => WikiListPage(
                  //             title: 'Entri sibohou',
                  //           )),
                  // );
                },
              ),
              ListTile(
                leading: Icon(Icons.wb_incandescent_outlined),
                title: Text(
                  'Dahö-dahö',
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                        color: Colors.black87,
                        // fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext context) => QuizPage()),
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => QuizPage()),
                  // );
                },
              ),
              ListTile(
                leading: Icon(Icons.campaign_outlined),
                title: Text(
                  'Turia',
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                        color: Colors.black87,
                        // fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (BuildContext context) => NewsPage()),
                  );
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => NewsPage()),
                  // );
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  'Setelan',
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                        color: Colors.black87,
                        // fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(builder: (BuildContext context) => SettingsPage()),
                  // );
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 4.0),
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
                      style: GoogleFonts.libreBaskerville(
                        textStyle:
                            TextStyle(color: Colors.deepOrange, fontSize: 52.0),
                      ),
                    ),
                    // Spacer(),
                    Flexible(
                      child: Container(
                        child: Text(
                          amaedola,
                          style: GoogleFonts.libreBaskerville(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                                // fontWeight: FontWeight.bold,
                                fontSize: 32.0),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '\u201e',
                      style: GoogleFonts.libreBaskerville(
                        textStyle:
                            TextStyle(color: Colors.deepOrange, fontSize: 52.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            Text(
              'mama\'anö Li Niha ba gu\'ö',
              style: GoogleFonts.comfortaa(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'dokumentasi, standardisasi, promosi',
              style: GoogleFonts.comfortaa(
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}
