import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserModel {
  final String name;
  final String photoUrl;
  final double score;

  UserModel(
      {@required this.name, @required this.photoUrl, @required this.score});

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  factory UserModel.fromMap(Map map) {
    return UserModel(
        name: map['name'], photoUrl: map['photoUrl'], score: map['score']);
  }
}
