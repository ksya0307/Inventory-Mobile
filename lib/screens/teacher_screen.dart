// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class TeacherScreen extends StatefulWidget {
  @override
  _TeacherScreenState createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  @override
  Widget build(BuildContext context) {
    final Map<String, Object> teacherData =
        ModalRoute.of(context).settings.arguments;

    String lastNameToString = teacherData['lastName'].toString();
    String fisrtNameToString = teacherData['firstName'].toString();
    String secondNameToString = teacherData['secondName'].toString();

    fisrtNameToString = fisrtNameToString[0];
    secondNameToString = secondNameToString[0];

    String dropdownValue = "120";

    final name = Container(
      padding: const EdgeInsets.all(17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$lastNameToString $fisrtNameToString. $secondNameToString.",
            style: const TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 18),
          )
        ],
      ),
    );

    final chooseClassroom = Card(
        margin: const EdgeInsets.only(left: 10, right: 10),
        color: const Color.fromRGBO(246, 246, 246, 1.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        // elevation: 3,
        child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  "Выберите аудиторию",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                const Text(
                  "№",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
                Card(
                    color: const Color.fromRGBO(238, 238, 238, 1.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 15, 0),
                      child: DropdownButtonHideUnderline(
                        child: Center(
                            child: DropdownButton<String>(
                          value: dropdownValue,
                          iconSize: 0.0,
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          // icon: const Visibility(
                          //     visible: false, child: Icon(Icons.arrow_downward)),
                          items: <String>['120', '405']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          }).toList(),
                        )),
                      ),
                    ))
              ],
            )));

    final equipment = Card(
      margin: const EdgeInsets.only(left: 10, right: 10),
      color: const Color.fromRGBO(246, 246, 246, 1.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: FittedBox(
        child: DataTable(columns: const <DataColumn>[
          DataColumn(
              label: Text("#",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                      fontSize: 18))),
          DataColumn(
              label: Text(
            "Инвентарный\nномер",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 13,
                fontFamily: 'Montserrat'),
          )),
          DataColumn(
              label: Text(
            "Название",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 13,
                fontFamily: 'Montserrat'),
          ))
        ], rows: const <DataRow>[
          DataRow(cells: <DataCell>[
            DataCell(Text(
              '120-01',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            )),
            DataCell(Text('101340003903',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    fontWeight: FontWeight.w600))),
            DataCell(Text("Компьютер",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    fontWeight: FontWeight.w600)))
          ])
        ]),
      ),
    );
    // print(receiveDatafromLogin['lastName'])
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Мои аудитории",
            style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(0, 64, 138, 1.0),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  name,
                  SizedBox(
                    width: double.maxFinite,
                    height: 56,
                    child: chooseClassroom,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(width: double.maxFinite, child: equipment),
                  const SizedBox(height: 10),
                ],
              )),
        ));
  }
}
