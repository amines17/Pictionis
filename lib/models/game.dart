import 'package:pictionis/models/player.dart';

class Game {
  String? key;
  GameData? gameData;

  Game({this.key, this.gameData});

  @override
  String toString() {
    return '{ $key, $gameData }';
  }
}

class GameData {
  String? hote;
  String? name;

  GameData({this.hote, this.name});

  GameData.fromJson(Map<dynamic, dynamic> json) {
    hote = json['hote'];
    name = json['name'];
  }

  @override
  String toString() {
    return '{ $hote, $name }';
  }

  //   factory GameData.fromJson(dynamic json) {
  //   return GameData(
  //       player: json['player'],
  //       name: json['name'],
  //       players: List.from(json['players']).map((e) => Player.fromJson(e)).toList());
  // }

}
