// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

Teacher userFromJson(String str) => Teacher.fromJson(json.decode(str));

String userToJson(Teacher data) => json.encode(data.toJson());

class Teacher {
  final int id;
  final String login;
  final String firstname;
  final String secondname;
  final String lastname;
  final String usertype;

  Teacher({
    this.id,
    this.login,
    this.firstname,
    this.secondname,
    this.lastname,
    this.usertype,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
      id: json['id'],
      login: json['login'],
      firstname: json['firstname'],
      secondname: json['secondname'],
      lastname: json['lastname'],
      usertype: json['usertype']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "login": login,
        "firstname": firstname,
        "secondname": secondname,
        "lastname": lastname,
        "usertype": usertype,
      };
}
