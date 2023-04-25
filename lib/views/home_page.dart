import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:pictionis/controllers/auth_controller.dart';
import 'package:pictionis/controllers/game_controller.dart';
import 'package:pictionis/models/game.dart';
import 'package:pictionis/views/game/game.dart';
import 'package:pictionis/views/widgets/appbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = AuthService.instance.currentUser;
  DatabaseReference ref = FirebaseDatabase.instance.ref();

  List<Game> gameList = [];

  @override
  void initState() {
    super.initState();
    // gameList = GameService.instance.retrieveStudentData();
    retrieveStudentData();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: ReusableAppBar.getAppBar(context),
      backgroundColor: theme.colorScheme.secondary,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text(
              user?.email ?? 'User email',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                GameService.instance.createGame('Partie de ${user!.email}');
              },
              child: const Text('Create Party'),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              height: 5,
              color: Colors.black,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Parties en cours",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < gameList.length; i++)
                    studentWidget(gameList[i])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void retrieveStudentData() {
    ref.child("Games").onChildAdded.listen((data) {
      GameData gameData = GameData.fromJson(data.snapshot.value as Map);
      Game game = Game(key: data.snapshot.key, gameData: gameData);
      gameList.add(game);
      setState(() {});
    });
  }

  Widget studentWidget(Game game) {
    return InkWell(
      onTap: () {
        confirmDialog(game.key, game.gameData!.name);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${game.gameData!.name}"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void confirmDialog(String? gameId, String? name) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Connexion"),
            titleTextStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
            actionsOverflowButtonSpacing: 20,
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Back")),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GameScreen(
                                gameId: gameId,
                              )),
                    );
                    GameService.instance.addPlayer(gameId, user!.uid);
                  },
                  child: const Text("Yes")),
            ],
            content: Text("Voulez vous rejoindre la $name ?"),
          );
        });
  }
}
