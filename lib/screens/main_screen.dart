// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Center(child: MainScreen())));
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

// final Map<String, Object> receiveDatafromLogin =
//     ModalRoute.of(context).settings.arguments;
//receiveDatafromLogin['lastName']
// ignore: prefer_const_constructors
class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final addEquipment = Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      color: Colors.blue,
      child: MaterialButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addEquipment');
        },
        padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
        minWidth: double.maxFinite,
        child: Text(
          "Добавить оборудование",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Arial',
              fontWeight: FontWeight.bold),
        ),
      ),
    );
    return Scaffold(
        backgroundColor: Colors.white,
        // ignore: prefer_const_constructors
        body: SafeArea(
            child: SingleChildScrollView(
                child: Container(
                    color: Colors.white,
                    margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                    //height: 500,
                    width: double.maxFinite,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          child: Container(
                            child: addEquipment,
                            margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
                          ),
                        ),
                        //addEquipment,
                        SizedBox(
                          child: Container(
                              height: 30,
                              color: Colors.white,
                              margin: EdgeInsets.fromLTRB(5, 15, 5, 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const <Widget>[
                                  Text("Меню",
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.black87))
                                ],
                              )),
                        ),
                        SizedBox(
                            width: double.maxFinite,
                            height: 100,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0)),
                                color: Colors.red,
                                elevation: 5,
                                child: InkWell(
                                    onTap: () {},
                                    child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: const <Widget>[
                                              Text(
                                                "Оборудование",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                  "Информация обо всем оборудовании в колледже по кабинетам",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Montserrat',
                                                    fontSize: 12,
                                                  )
                                                  //fontWeight: FontWeight.bold),
                                                  ),
                                            ]))))),
                        SizedBox(
                            height: 100,
                            width: double.maxFinite,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0)),
                                color: Colors.deepPurple,
                                elevation: 5,
                                child: InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        "История перемещения",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Montserrat',
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )))),
                        SizedBox(
                            height: 100,
                            width: double.maxFinite,
                            child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(9.0)),
                                color: Colors.orange,
                                elevation: 5,
                                child: InkWell(
                                    onTap: () {},
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        "Ремонт",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Montserrat',
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ))))
                      ],
                    )))));
  }
}
