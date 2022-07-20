import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'displayData.dart';

late String? api_key = "02bfaa74b78b78a3d16c535aa05b0be2";

class Networking {
  late String? TrackID = "";

  String getTracks =
      "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=$api_key";
  // String trackDetails =
  //     "https://api.musixmatch.com/ws/1.1/track.get?track_id=$TrackID&apikey=$api_key";
  // String trackLyrics =
  //     "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$TrackID&apikey=$api_key";

  Future<Music> getTracksDetails() async {
    http.Response response = await http.get(
      Uri.parse(getTracks),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return Music.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("error cought");
    }
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Networking networking = Networking();

  late Future<Music> fetch;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetch = networking.getTracksDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.greenAccent,
        appBar: AppBar(
          backgroundColor: Colors.black26,
          title: Text("Lyrics"),
        ),
        // body: Container(
        //   padding: EdgeInsets.fromLTRB(30, 40, 30, 40),
        //   child: TextButton(
        //       onPressed: networking.getTracksDetails,
        //       child: Text('Click here')),
        // ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: FutureBuilder<Music>(
              future: fetch,
              builder: ((context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.message!.body!.trackList!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data!.message!.body!
                            .trackList![index].track!.trackName
                            .toString()),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
              })),
        ),
      ),
    );
  }
}
