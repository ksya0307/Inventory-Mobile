// @dart=2.9
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myhands/screens/addequipment_screen.dart';
import 'package:myhands/screens/main_screen.dart';
import 'package:myhands/screens/login_screen.dart';
import 'package:myhands/screens/teacher_screen.dart';

void main() {
  runApp(MyApp());
}

//главный класс проекта
//stateless - не будет изменен, нет взаимодействия между юзером и виджетом
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Учет оборудования',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/mainScreen': (context) => MainScreen(),
        '/addEquipment': (context) => AddEquipment(),
        '/teacherScreen': (context) => TeacherScreen(),
      },
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity
              .adaptivePlatformDensity //адаптивность под ios/android
          ),
    );
  }
}
