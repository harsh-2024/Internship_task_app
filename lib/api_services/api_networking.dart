import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:music_app/api_services/displayData2.dart';
import 'package:music_app/api_services/displayData3.dart';
import 'package:music_app/screens/homePage.dart';
import 'displayData.dart';

late String? api_key = "02bfaa74b78b78a3d16c535aa05b0be2";

class Networking {
  String getTracks =
      "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=$api_key";
  String trackDetails =
      "https://api.musixmatch.com/ws/1.1/track.get?track_id=$TrackID&apikey=$api_key";
  String trackLyrics =
      "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$TrackID&apikey=$api_key";

  Future<Music> getTracksDetails() async {
    http.Response response = await http.get(
      Uri.parse(getTracks),
    );
    if (response.statusCode == 200) {
      return Music.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("error cought");
    }
  }

  Future<Music2> getTracksDetailsSecondScreen() async {
    http.Response response = await http.get(
      Uri.parse(trackDetails),
    );
    if (response.statusCode == 200) {
      return Music2.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("error cought");
    }
  }

  Future<Music3> getLyrics() async {
    http.Response response = await http.get(
      Uri.parse(trackLyrics),
    );
    if (response.statusCode == 200) {
      return Music3.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("error cought");
    }
  }
}
