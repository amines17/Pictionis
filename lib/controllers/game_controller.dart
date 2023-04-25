import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/animation.dart';
import 'package:pictionis/models/drawing_point.dart';
import 'package:pictionis/models/game.dart';

import 'dart:convert';

class GameService {
  static GameService get instance => _instance;
  static final GameService _instance = GameService._privateConstructor();
  GameService._privateConstructor();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  void createGame(String name) async {
    await database
        .ref("/Games/${currentUser?.uid}")
        .set({"hote": "${currentUser?.uid}", "name": name});

    await database.ref("/game/${currentUser?.uid}").onDisconnect().remove();
  }

  void addPlayer(String? gameId, String? id) async {
    DatabaseReference gameListRef =
        FirebaseDatabase.instance.ref("Games/$gameId");
    DatabaseReference newPlayerRef = gameListRef.child('players');
    newPlayerRef.child('$id').set({"active": true});
  }

  // List<Game> retrieveStudentData() {
  //   List<Game> gameList = [];
  //   ref.child("Games").onChildAdded.listen((data) {
  //     GameData gameData = GameData.fromJson(data.snapshot.value as Map);
  //     Game game = Game(key: data.snapshot.key, gameData: gameData);
  //     gameList.add(game);
  //     print(gameList);
  //   });

  //   return gameList;
  // }

  void endGame(String gameId) async {
    await database.ref("/Games/$gameId").remove();
  }

  void leftGame(String gameId) async {
    await database.ref("Games/$gameId/players/${currentUser?.uid}").remove();
  }

  void updateDrawingPoints(String gameId, DrawingPoint drawingPoint) async {
    DatabaseReference gameListRef =
        FirebaseDatabase.instance.ref("Games/$gameId");
    DatabaseReference newPlayerRef = gameListRef.child('draw');
    newPlayerRef.push().set({"drawingPoint": "$drawingPoint"});
  }

  Future<void> getDrawingPoints() async {}
}
