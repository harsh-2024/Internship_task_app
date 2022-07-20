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

  Future<TrackList> getTracksDetails() async {
    http.Response response = await http.get(
      Uri.parse(getTracks),
    );
    if (response.statusCode == 200) {
      print(response.body);
      return TrackList.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("error cought");
    }
  }
}
