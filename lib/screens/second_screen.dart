import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:music_app/api_services/api_networking.dart';
import 'package:music_app/api_services/displayData.dart';
import 'package:music_app/api_services/displayData3.dart';
import 'package:music_app/screens/homePage.dart';
import 'package:music_app/api_services/displayData2.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  Networking networking = Networking();
  late Future<Music2> fetch;
  late Future<Music3> fetch2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch = networking.getTracksDetailsSecondScreen();
    fetch2 = networking.getLyrics();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.greenAccent,
        body: Container(
          child: Column(
            children: [
              FutureBuilder<Music2>(
                future: fetch,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Text(snapshot.data!.message!.body!.track!.albumName
                            .toString()),
                        Text((snapshot.data!.message!.body!.track!.artistName
                            .toString()))
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                },
              ),
              FutureBuilder<Music3>(
                future: fetch2,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!.message!.body!.lyrics!.lyricsBody
                        .toString());
                  } else {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
