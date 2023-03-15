import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                keyNote(0xffD00000, 1),
                keyNote(0xffFB5607, 2),
                keyNote(0xffFFBE0B, 3),
                keyNote(0xffFF006E, 4),
                keyNote(0xff8338EC, 5),
                keyNote(0xff3A86FF, 6),
                keyNote(0xff7BFFD0, 7),
              ],
            ),
          ),
        ),
      ),
    );
  }

  playNote(int note) async {
      AudioPlayer player = AudioPlayer();
      await player.setSource(AssetSource('note$note.wav'));
      await player.resume();
  }

  keyNote(int color, int note) {
      return Expanded(
        child: MaterialButton(
          onPressed: () async { playNote(note); } ,
          color: Color(color),
        ),
      );
  }
}