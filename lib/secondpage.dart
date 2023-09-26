import 'dart:ui';
import 'package:translator/translator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_tts/flutter_tts.dart';

class thirdscreen extends StatefulWidget {
  var answer1;
  thirdscreen({super.key, required this.answer1});

  @override
  State<thirdscreen> createState() => _thirdscreenState();
}

class _thirdscreenState extends State<thirdscreen> {
  final FlutterTts flutterTts = FlutterTts();

  speak1() async {
    await flutterTts.setLanguage("en-IN");
    await flutterTts.setPitch(1);
    await flutterTts.speak(widget.answer1);
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
        appBar: AppBar(
          title: Text('languages'),
          backgroundColor: Colors.orangeAccent,
        ),
        backgroundColor: Colors.transparent,
        body: Column(children: [
          Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.50,
              child: Center(
                child: Text(
                  widget.answer1,
                  style: TextStyle(color: Colors.black87, fontSize: 30),
                ),
              )),
          Container(
            alignment: Alignment.center,
            child: FloatingActionButton.large(
              child: Icon(
                Icons.volume_up_sharp,
                size: 70,
                color: Colors.black,
              ),
              onPressed: () {
                speak1();
              },
            ),
          )
        ]),
      ),
    );
  }
}

class fourthscreen extends StatefulWidget {
  var answer1;
  fourthscreen({super.key, required this.answer1});

  @override
  State<fourthscreen> createState() => _fourthscreenState();
}

class _fourthscreenState extends State<fourthscreen> {
  final FlutterTts flutterTts = FlutterTts();

  speak2() async {
    await flutterTts.setLanguage("hi");
    await flutterTts.setPitch(0);
    await flutterTts.speak(widget.answer1);
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
        appBar: AppBar(
          title: Text('pronounce'),
          backgroundColor: Colors.orangeAccent,
        ),
        backgroundColor: Colors.transparent,
        body: Column(children: [
          Container(
              width: MediaQuery.of(context).size.width * 1,
              height: MediaQuery.of(context).size.height * 0.50,
              child: Center(
                child: Text(
                  widget.answer1,
                  style: TextStyle(color: Colors.black87, fontSize: 30),
                ),
              )),
          Container(
            alignment: Alignment.center,
            child: FloatingActionButton.large(
              child: Icon(
                Icons.volume_up_sharp,
                size: 70,
                color: Colors.black,
              ),
              onPressed: () {
                speak2();
              },
            ),
          )
        ]),
      ),
    );
  }
}
