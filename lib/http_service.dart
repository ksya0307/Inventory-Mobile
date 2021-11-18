// ignore: import_of_legacy_library_into_null_safe
// ignore_for_file: avoid_print, import_of_legacy_library_into_null_safe, duplicate_ignore, unused_local_variable, missing_return

//import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';
import 'package:crypt/crypt.dart';
import 'package:myhands/models/computernumbers_model.dart';
import 'package:myhands/models/teacher_model.dart';

class HttpService {
  final String url = "e59c-31-204-181-129.ngrok.io";

  Future<void> getUser(
      String login, String password, BuildContext context) async {
    final queryParams = {
      'login': login,
      'password': Crypt.sha256(password, salt: 'abcdefghijklmnop').toString(),
    };

    //natalia SazNat120 - reader
    //himAnna - reader
    //elena P@ssw0rd - moderator
    //q1w2e3r4 - moderator
    print(password +
        " " +
        Crypt.sha256(password, salt: 'abcdefghijklmnop').toString());
    final uriLogin = Uri.https(url, '/login', queryParams);
    if (login.isNotEmpty && password.isNotEmpty) {
      Response res = await get(uriLogin);
      print("  " + Crypt.sha256(password, salt: 'abcdefghijklmnop').toString());
      if (res.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(res.body);
        //print(res.body + "dsf");
        var users = Teacher.fromJson(body);
        // print(users.login + " login");
        // print(users.firstName + " name");
        final rightData = Fluttertoast.showToast(
            msg: "Вход выполнен " + (users.firstname),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: const Color.fromRGBO(229, 229, 229, 1.0),
            textColor: Colors.black,
            fontSize: 14.0);
        if (users.usertype == "Модератор") {
          Navigator.pushNamed(context, '/mainScreen', arguments: {
            "secondname": users.secondname,
            "firstname": users.firstname,
            "lastname": users.lastname
          });
        }
        if (users.usertype == "Читатель") {
          Navigator.pushNamed(context, '/teacherScreen', arguments: {
            "secondname": users.secondname,
            "firstname": users.firstname,
            "lastname": users.lastname
          });
        }
      } else {
        final wrongData = Fluttertoast.showToast(
            msg: "Неверно введен логин или пароль",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: const Color.fromRGBO(229, 229, 229, 1.0),
            textColor: Colors.black,
            fontSize: 14.0);
      }
    } else {
      final emptyField = Fluttertoast.showToast(
          msg: "Заполните поля",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color.fromRGBO(229, 229, 229, 1.0),
          textColor: Colors.black,
          fontSize: 14.0);
    }
  }

  Future<List<Classroom>> getClassrooms(BuildContext context) async {
    final uriClassroom = Uri.https(url, '/classrooms');
    Response res = await get(uriClassroom);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Classroom> classrooms =
          body.map((dynamic item) => Classroom.fromJson(item)).toList();

      return classrooms;
    } else {
      throw Exception("Что-то пошло не так");
    }
  }

  Future<List<Teacher>> getTeachers(BuildContext context) async {
    final uriTeachers = Uri.https(url, '/teachers');
    Response res = await get(uriTeachers);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Teacher> teachers =
          body.map((dynamic item) => Teacher.fromJson(item)).toList();

      return teachers;
    } else {
      throw Exception("Что-то пошло не так");
    }
  }

  Future<List<EquipmentNumbers>> getEquipmentNumber(String inClassroom) async {
    final queryParams = {'classroom': inClassroom};
    final uriClNumbers = Uri.https(url, '/computerNumbers', queryParams);

    Response res = await get(uriClNumbers);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<EquipmentNumbers> equipmentNumbers =
          body.map((dynamic item) => EquipmentNumbers.fromJson(item)).toList();
      return equipmentNumbers;
    } else {
      throw Exception("Что-то пошло не так");
    }
  }
}
