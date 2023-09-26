import 'package:flutter/material.dart';
import 'package:pblfinal/secondpage.dart';
import 'package:translator/translator.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:google_ml_kit/google_ml_kit.dart';

void main() {
  runApp(MaterialApp(
    home: App(),
  ));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  String texts = "";
  File? _image;
  RecognizedText? _extractedData;
  Future getImage({required source}) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
      processdata(imageTemporary.path);
    });
  }

  Future processdata(String path) async {
    final inputImage = InputImage.fromFilePath(path);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);
    final RecognizedText recognizedText =
        await textRecognizer.processImage(inputImage);

    _extractedData = recognizedText;

    for (TextBlock block in recognizedText.blocks) {
      texts = block.text;
    }
    print("the output text is ");
    print(texts);
  }

  GoogleTranslator translator =
      new GoogleTranslator(); //using google translator

  var out1;
//getting text

  void trans() {
    //hindi
    translator.translate(texts, to: 'hi') //translating to hi = hindi
        .then((output) {
      setState(() {
        out1 = output; //placing the translated text to the String to be used
      });
      print(out1);
    });
  }

  void trans2() {
    //kannada
    translator.translate(texts, to: 'kn') //translating to hi = hindi
        .then((output1) {
      setState(() {
        out1 = output1; //placing the translated text to the String to be used
      });
      print(out1);
    });
    out1 = texts;
  }

  void trans3() {
    //telgu
    translator.translate(texts, to: 'te') //translating to hi = hindi
        .then((output1) {
      setState(() {
        out1 = output1; //placing the translated text to the String to be used
      });
      print(out1);
    });
    out1 = texts;
  }

  void trans4() {
    //tamil
    translator.translate(texts, to: 'ta') //translating to hi = hindi
        .then((output1) {
      setState(() {
        out1 = output1; //placing the translated text to the String to be used
      });
      print(out1);
    });
    // out1 = texts;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.teal, Color.fromARGB(255, 108, 17, 206)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // backgroundColor: Color.fromARGB(255, 219, 168, 228),
        appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Text("Welcome !!"),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 1 / 5,
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all()),
                    child: Center(
                      child: Text(
                        out1.toString(),
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 1 / 20,
                        ),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  FloatingActionButton.large(
                                    child: Icon(
                                      Icons.camera,
                                      size: 70,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      getImage(source: ImageSource.camera);
                                    },
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text('SCAN',
                                        style: TextStyle(
                                            color: Colors.orangeAccent)),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  FloatingActionButton.large(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => fourthscreen(
                                                  answer1: texts.toString(),
                                                )),
                                      );
                                    },
                                    child: Icon(
                                      Icons.volume_up_outlined,
                                      size: 70,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text('PRONOUNCE',
                                        style: TextStyle(
                                            color: Colors.orangeAccent)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Container(
                              child: FloatingActionButton.large(
                                child: Icon(
                                  Icons.translate,
                                  size: 70,
                                  color: Colors.black,
                                ),
                                //on press to translate the language using function
                                onPressed: () {
                                  trans();
                                },
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text('HINDI',
                                  style: TextStyle(color: Colors.orangeAccent)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              alignment: Alignment.center,
                              child: FloatingActionButton.large(
                                child: Icon(
                                  Icons.translate,
                                  size: 70,
                                  color: Colors.black,
                                ), //on press to translate the language using function
                                onPressed: () {
                                  trans2();
                                },
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                'KANNADA',
                                style: TextStyle(color: Colors.orangeAccent),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Container(
                              child: FloatingActionButton.large(
                                child: Icon(
                                  Icons.translate,
                                  size: 70,
                                  color: Colors.black,
                                ),
                                //on press to translate the language using function
                                onPressed: () {
                                  trans3();
                                },
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text('TELUGU',
                                  style: TextStyle(color: Colors.orangeAccent)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              alignment: Alignment.center,
                              child: FloatingActionButton.large(
                                child: Icon(
                                  Icons.translate,
                                  size: 70,
                                  color: Colors.black,
                                ), //on press to translate the language using function
                                onPressed: () {
                                  trans4();
                                },
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                'TAMIL',
                                style: TextStyle(color: Colors.orangeAccent),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  FloatingActionButton.large(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => thirdscreen(
                                  answer1: out1.toString(),
                                )),
                      );
                    },
                    child: Icon(
                      Icons.volume_up_outlined,
                      size: 70,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text('SPEAK',
                        style: TextStyle(color: Colors.orangeAccent)),
                  ),

                  //translated string
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
