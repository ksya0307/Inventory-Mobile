import 'dart:convert';

Classrooms classroomsFromJson(String str) =>
    Classrooms.fromJson(json.decode(str));

String classroomsToJson(Classrooms data) => json.encode(data.toJson());

class Classrooms {
  Classrooms({
    this.id,
    this.classnumber,
    this.teachers,
  });

  int id;
  String classnumber;
  Teachers teachers;

  factory Classrooms.fromJson(Map<String, dynamic> json) => Classrooms(
        id: json["id"],
        classnumber: json["classnumber"],
        teachers: Teachers.fromJson(json["teachers"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "classnumber": classnumber,
        "teachers": teachers.toJson(),
      };
}

class Teachers {
  Teachers({
    this.id,
    this.firstName,
    this.secondName,
    this.lastName,
    this.login,
    this.password,
    this.userType,
  });

  int id;
  String firstName;
  String secondName;
  String lastName;
  String login;
  String password;
  String userType;

  factory Teachers.fromJson(Map<String, dynamic> json) => Teachers(
        id: json["id"],
        firstName: json["firstName"],
        secondName: json["secondName"],
        lastName: json["lastName"],
        login: json["login"],
        password: json["password"],
        userType: json["userType"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "secondName": secondName,
        "lastName": lastName,
        "login": login,
        "password": password,
        "userType": userType,
      };
}
