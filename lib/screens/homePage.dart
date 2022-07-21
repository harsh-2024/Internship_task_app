import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:music_app/api_services/api_networking.dart';

import 'package:music_app/api_services/displayData.dart';
import 'package:music_app/screens/second_screen.dart';

late String? TrackID = "";

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Networking networking = Networking();

  late Future<Music> fetch;
  // void gettingTrackID{
  //   TrackID = snapshot.data?.message!.body!
  //                               .trackList![index].track!.trackId
  //                               .toString(),
  // }
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
                    itemExtent: 80,
                    shrinkWrap: true,
                    itemCount: snapshot.data!.message!.body!.trackList!.length,
                    itemBuilder: (context, index) {
                      return Material(
                        color: Colors.greenAccent,
                        elevation: 20,
                        borderRadius: BorderRadius.circular(10),
                        child: ListTile(
                          onTap: () => {
                            TrackID = snapshot.data?.message!.body!
                                .trackList![index].track!.trackId
                                .toString(),
                            print(TrackID),
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SecondScreen(),
                                ))
                          },
                          dense: false,
                          contentPadding: EdgeInsets.all(10),
                          title: Text(snapshot.data!.message!.body!
                              .trackList![index].track!.trackName
                              .toString()),
                        ),
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
