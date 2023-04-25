class Player {
  String? id;

  Player({this.id});

  Player.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
  }
}
