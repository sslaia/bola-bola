import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePage extends StatefulWidget {
  CreatePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final _entryController = TextEditingController();
  final _definitionController = TextEditingController();
  final _exampleController = TextEditingController();
  final _definition2Controller = TextEditingController();
  final _example2Controller = TextEditingController();
  final _pageController = TextEditingController();
  final _translationController = TextEditingController();
  final _translationExampleController = TextEditingController();
  final _translation2Controller = TextEditingController();
  final _translationExample2Controller = TextEditingController();
  final _synonymController = TextEditingController();
  final _antonymController = TextEditingController();
  final _relatedController = TextEditingController();

  String wikiLanguage = 'Nias';
  String wikiClass = 'Verba';

  String wikiBuiltPage = '';

  String builtLanguage,
      builtClass,
      builtEntry,
      builtDefinition,
      builtExample,
      builtDefinition2,
      builtExample2,
      builtTranslation,
      builtTranslation2,
      builtTranslationExample,
      builtTranslationExample2,
      builtSynonym,
      builtAntonym,
      builtRelated,
      builtCategory,
      builtCategory2;

  final _createWikiPageKey = GlobalKey<FormState>();

  void initState() {
    super.initState();
  }

  void _clearWikiForm() {
    _entryController.clear();
    _definitionController.clear();
    _exampleController.clear();
    _definition2Controller.clear();
    _example2Controller.clear();
    _pageController.clear();
    _translationController.clear();
    _translationExampleController.clear();
    _translation2Controller.clear();
    _translationExample2Controller.clear();
    _synonymController.clear();
    _antonymController.clear();
    _relatedController.clear();
  }

  @override
  void dispose() {
    _entryController.dispose();
    _definitionController.dispose();
    _exampleController.dispose();
    _definition2Controller.dispose();
    _example2Controller.dispose();
    _pageController.dispose();
    _translationController.dispose();
    _translationExampleController.dispose();
    _translation2Controller.dispose();
    _translationExample2Controller.dispose();
    _synonymController.dispose();
    _antonymController.dispose();
    _relatedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: GoogleFonts.comfortaa(
            textStyle: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _createWikiPageKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: wikiLanguage,
                        // icon: Icon(Icons.language_outlined),
                        elevation: 16,
                        style: GoogleFonts.comfortaa(
                          textStyle: TextStyle(
                              color: Colors.indigo,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                        // style: TextStyle(color: Colors.indigo),
                        items: <String>[
                          'Nias',
                          'Indonesia',
                          'English',
                          'Deutsch'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String value) {
                          setState(() {
                            wikiLanguage = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: wikiClass,
                        // icon: Icon(Icons.language_outlined),
                        elevation: 16,
                        style: GoogleFonts.comfortaa(
                          textStyle: TextStyle(
                              color: Colors.indigo,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                        // style: TextStyle(color: Colors.teal),
                        items: <String>[
                          'Verba',
                          'Nomina',
                          'Adjektiva',
                          'Adverbia'
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String newValue) {
                          setState(() {
                            wikiClass = newValue;
                          });
                        },
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                        child: Text(
                          'Fuli börögö',
                          style: GoogleFonts.comfortaa(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        onPressed: () {
                          _clearWikiForm();
                        })
                  ],
                ),
                TextFormField(
                  controller: _entryController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Sura bakha wehede si bohou';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Entri',
                    hintText: 'Fehede sedöna mube ba kamus',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                TextFormField(
                  controller: _definitionController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Sura bakha definisi wehede';
                    }
                    return null;
                  },
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Definisi',
                    hintText: 'Sura definisi wehede',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                TextFormField(
                  controller: _exampleController,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Duma-duma',
                    hintText: 'Sura ngawalö wehede si tobali duma-duma',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                TextFormField(
                  controller: _definition2Controller,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Definisi 2',
                    hintText: 'Sura definisi tanö bö\'ö wehede',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                TextFormField(
                  controller: _example2Controller,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Duma-duma definisi 2',
                    hintText: 'Sura ngawalö wehede si tobali duma-duma',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                TextFormField(
                  controller: _translationController,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Eluaha definisi',
                    hintText: 'Sura geluaha ba Li Indonesia',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                TextFormField(
                  controller: _translationExampleController,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Eluaha duma-duma moroi yaŵa',
                    hintText: 'Sura geluaha duma-duma wehede moroi yaŵa',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                TextFormField(
                  controller: _translation2Controller,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Eluaha definisi 2',
                    hintText: 'Sura geluaha definisi 2',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                TextFormField(
                  controller: _translationExample2Controller,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Eluaha duma-duma definisi 2',
                    hintText: 'Sura geluaha duma-duma definisi 2',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                TextFormField(
                  controller: _synonymController,
                  decoration: InputDecoration(
                    labelText: 'Fehede si fagölö eluaha',
                    hintText: 'Sura wehede si fagölö eluaha khönia',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                TextFormField(
                  controller: _antonymController,
                  decoration: InputDecoration(
                    labelText: 'Fehede si fa\'ero eluaha',
                    hintText: 'Sura wehede si fa\'ero eluaha khönia',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                TextFormField(
                  controller: _relatedController,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Fehede si fakhai',
                    hintText:
                        'Sura oi wehede si fakhai. Ero wehede sara nga\'oli, tebörögö faoma *',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                  style: GoogleFonts.comfortaa(
                    textStyle: TextStyle(
                        color: Colors.black54,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      child: Text('Fa\'ohe\'ö'),
                      onPressed: () {
                        if (_createWikiPageKey.currentState.validate()) {
                          setState(() {
                            _buildWikiPage();

                            // SubmittedPage (wikiLanguage, wikiClass, wikiEntry, wikiDefinition, wikiExample);
                          });
                        } else {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.deepOrange,
                              content: Text(
                                'So zi fasala! \nSi lö\'ö-lö\'önia mufo\'ösi entri ba definisi.',
                                style: GoogleFonts.comfortaa(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          );
                        }
                        print(wikiBuiltPage);
                        _createWikiPageKey.currentState.reset();
                        _clearWikiForm();
                      },
                    ),
                    Spacer(),
                    ElevatedButton(
                        child: Text(
                          'Fuli börögö',
                          style: GoogleFonts.comfortaa(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        onPressed: () {
                          _clearWikiForm();
                        })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getBuiltLanguage(String language) {
    if (language == 'Nias') {
      builtCategory = '\n\n[[Category:Wt/nia]]\n[[Category:Wt/nia/Nias]]';
      return builtLanguage = '{{Wt/nia/nia}}\n\n';
    } else if (language == 'Indonesia') {
      builtCategory = '\n[[Category:Wt/nia]]\n[[Category:Wt/nia/Indonesia]]';
      return builtLanguage = '{{Wt/nia/id}}\n\n';
    } else if (language == 'English') {
      builtCategory = '\n[[Category:Wt/nia]]\n[[Category:Wt/nia/English]]';
      return builtLanguage = '{{Wt/nia/en}}\n\n';
    } else {
      builtCategory = '\n[[Category:Wt/nia]]\n[[Category:Wt/nia/Deutsch]]';
      return builtLanguage = '{{Wt/nia/de}}\n\n';
    }
  }

  String _getBuiltClass(String wikiclass) {
    if (wikiclass == 'Nomina') {
      builtCategory2 = '\n[[Category:Wt/nia/Nomina]]';
      return builtClass = '{{Wt/nia/nomina}}\n\n';
    } else if (wikiclass == 'Verba') {
      builtCategory2 = '\n[[Category:Wt/nia/Verba]]';
      return builtClass = '{{Wt/nia/verba}}\n\n';
    } else if (wikiclass == 'Adjektiva') {
      builtCategory2 = '\n[[Category:Wt/nia/Adjektiva]]';
      return builtClass = '{{Wt/nia/adjektiva}}\n\n';
    } else {
      builtCategory2 = '\n[[Category:Wt/nia/Adverbia]]';
      return builtClass = '{{Wt/nia/adverbia}}\n\n';
    }
  }

  String _getBuiltEntry(String entry) {
    if (entry.isEmpty || entry == '') {
      return builtEntry = '';
    } else {
      return builtEntry = '\'\'\'' + entry + '\'\'\'\n';
    }
  }

  String _getBuiltDefinition(String definition) {
    if (definition.isEmpty || definition == '') {
      return builtDefinition = '';
    } else {
      return builtDefinition = '# ' + definition + '\n';
    }
  }

  String _getBuiltExample(String example) {
    if (example.isEmpty || example == '') {
      return builtExample = '';
    } else {
      return builtExample = '#* \'\'' + example + '\'\'\n';
    }
  }

  String _getBuiltDefinition2(String definition2) {
    if (definition2.isEmpty || definition2 == '') {
      return builtDefinition2 = '';
    } else {
      return builtDefinition2 = '# ' + definition2 + '\n';
    }
  }

  String _getBuiltExample2(String example2) {
    if (example2.isEmpty || example2 == '') {
      return builtExample2 = '';
    } else {
      return builtExample2 = '#* \'\'' + example2 + '\'\'\n';
    }
  }

  String _getBuiltTranslation(String translation) {
    if (translation.isEmpty || translation == '') {
      return builtTranslation = '';
    } else {
      return builtTranslation =
          '\n{{Wt/nia/eluaha}}\n\n* {{Wt/nia/-id}}: ' + translation + '\n';
    }
  }

  String _getBuiltTranslation2(String translation2) {
    if (translation2.isEmpty || translation2 == '') {
      return builtTranslation2 = '';
    } else {
      return builtTranslation2 =
          '\n{{Wt/nia/eluaha}}\n\n* ' + translation2 + '\n';
    }
  }

  String _getBuiltTranslationExample(String example) {
    if (example.isEmpty || example == '') {
      return builtTranslationExample = '';
    } else {
      return builtTranslationExample = '** \'\'' + example + '\'\'\n';
    }
  }

  String _getBuiltTranslationExample2(String example2) {
    if (example2.isEmpty || example2 == '') {
      return builtTranslationExample2 = '';
    } else {
      return builtTranslationExample2 = '** \'\'' + example2 + '\'\'\n';
    }
  }

  String _getBuiltSynonym(String synonym) {
    if (synonym.isEmpty || synonym == '') {
      return builtSynonym = '';
    } else {
      return builtSynonym =
          '\n{{Wt/nia/sinonim}}\n\n* [[Wt/nia/' + synonym + ']]\n';
    }
  }

  String _getBuiltAntonym(String antonym) {
    if (antonym.isEmpty || antonym == '') {
      return builtAntonym = '';
    } else {
      return builtAntonym =
          '\n{{Wt/nia/antonim}}\n\n* [[Wt/nia/' + antonym + ']]\n';
    }
  }

  String _getBuiltRelated(String related) {
    if (related.isEmpty || related == '') {
      return builtRelated = '';
    } else {
      return builtRelated = '\n{{Wt/nia/fakhai}}\n\n* ' + related + '\n';
    }
  }

  void _buildWikiPage() {
    builtLanguage = _getBuiltLanguage(wikiLanguage);
    builtClass = _getBuiltClass(wikiClass);
    builtEntry = _getBuiltEntry(_entryController.text);
    builtDefinition = _getBuiltDefinition(_definitionController.text);
    builtExample = _getBuiltExample(_exampleController.text);
    builtDefinition2 = _getBuiltDefinition2(_definition2Controller.text);
    builtExample2 = _getBuiltExample2(_example2Controller.text);
    builtTranslation = _getBuiltTranslation(_translationController.text);
    builtTranslation2 = _getBuiltTranslation2(_translation2Controller.text);
    builtTranslationExample =
        _getBuiltTranslationExample(_translationExampleController.text);
    builtTranslationExample2 =
        _getBuiltTranslationExample2(_translationExample2Controller.text);
    builtSynonym = _getBuiltSynonym(_synonymController.text);
    builtAntonym = _getBuiltAntonym(_antonymController.text);
    builtRelated = _getBuiltRelated(_relatedController.text);

    wikiBuiltPage = builtLanguage +
        builtClass +
        builtEntry +
        builtDefinition +
        builtExample +
        builtDefinition2 +
        builtExample2 +
        builtTranslation +
        builtTranslationExample +
        builtTranslation2 +
        builtTranslationExample2 +
        builtSynonym +
        builtAntonym +
        builtRelated +
        builtCategory +
        builtCategory2;
  }
}
