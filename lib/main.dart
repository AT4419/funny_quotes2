import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funny Quotes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> quoteList = [
    'เรามัดใจใครไม่ได้หรอก ขนาดมัดผมยังลำบากเลย',
    'ถึงไม่งามบาดตา แต่ปากหมาบาดใจนะ',
    'เคยเป็นแล้วคนดี ตอนนี้เป็นคนโสด',
    'เราชอบตัวเองตอนเผลอ แล้วเธอชอบเราตอนไหน',
    'ไม่มีหรอก "เราชนะ" มีแต่ "เราชอบนะ" เธอชอบไหม',
    'ก้าวแรกโดนใจ ก้าวต่อไปโดนเท',
  ];
  var quote = quoteList[0]; // state variable

  void handleClickGo() {
    setState(() {
      var rand = Random();
      var randomIndex = rand.nextInt(quoteList.length);
      quote = quoteList[randomIndex];
      var str;
      for(int i=0; i<quoteList.length;i++) {
        if(quote == str) {
          quote = quoteList[randomIndex];
        }
        else {
          continue;
        }
      }
      str = quote;
    });
  }

  @override
  Widget build(BuildContext context) {
    var random = Random();
    return Scaffold(
      appBar: AppBar(title: const Text('คำคมกวนๆ')),
      floatingActionButton: FloatingActionButton(
        onPressed: handleClickGo,
        child: const Center(
          child: Text(
            'Next Quote',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            quote,
            style: TextStyle(
              fontSize: 50,
              color: Color.fromARGB(random.nextInt(255), random.nextInt(255), random.nextInt(255), random.nextInt(255)),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}