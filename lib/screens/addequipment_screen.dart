// ignore_for_file: use_key_in_widget_constructors, missing_return, unnecessary_this, prefer_const_literals_to_create_immutables, deprecated_member_use, unused_local_variable

//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myhands/http_service.dart';
import 'package:myhands/models/classrooms_model.dart';
import 'package:myhands/models/computernumbers_model.dart';

class AddEquipment extends StatefulWidget {
  //const AddEquipment({ Key? key }) : super(key: key);

  @override
  _AddEquipmentState createState() => _AddEquipmentState();
}

final HttpService httpService = HttpService();

class _AddEquipmentState extends State<AddEquipment> {
  DateTime pickedDate;

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
  }

  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  String dropdownValueGet = '109'; //закуплено
  String dropdownValueIn = '109'; //распределено
  String inClassroom;
  String equipmentNumber;
  final controllerInventoryNumber = TextEditingController();
  final controllerNumberInClassroom = TextEditingController();
  //List<Classroom> classrooms;
  @override
  Widget build(BuildContext context) {
    final inventoryNumberField = TextFormField(
      controller: controllerInventoryNumber,
      autofocus: false,
      textAlign: TextAlign.start,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
      ],
      keyboardType:
          const TextInputType.numberWithOptions(signed: false, decimal: false),
      decoration: InputDecoration(
        labelText: 'Инвентарный номер',
        suffixIcon: IconButton(
            icon: const Icon(Icons.border_color_rounded),
            color: Colors.grey,
            onPressed: () {}),
        contentPadding: const EdgeInsets.all(10),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
                color: Color.fromRGBO(0, 47, 167, 1.0), width: 2.0)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
                color: Color.fromRGBO(0, 47, 167, 1.0), width: 2.0)),
        fillColor: Colors.white12,
        enabled: true,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Добавление оборудования'),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
            child: Stepper(
          type: stepperType,
          physics: const ScrollPhysics(),
          currentStep: _currentStep,
          onStepTapped: (step) => tapped(step),
          controlsBuilder: (BuildContext context,
              {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
            return Row(
              children: <Widget>[
                FlatButton(
                    color: Colors.amber,
                    onPressed: continued,
                    child: const Text("Продолжить")),
                FlatButton(onPressed: cancel, child: const Text("Отменить"))
              ],
            );
          },
          steps: <Step>[
            Step(
              title: const Text('Аудитории'),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Распределено"),
                        FutureBuilder<List<Classroom>>(
                            future: httpService.getClassrooms(context),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<Classroom>> snapshot) {
                              if (snapshot.connectionState !=
                                  ConnectionState.done) {
                                return const SizedBox(
                                    child: CircularProgressIndicator(
                                      strokeWidth: 3,
                                    ),
                                    height: 20.0,
                                    width: 20.0);
                              }
                              if (snapshot.hasData) {
                                if (snapshot.data != null) {
                                  List<Classroom> classrooms = snapshot.data;
                                  return DropdownButton<String>(
                                    value: dropdownValueIn,
                                    onChanged: (String val) {
                                      _onDropDownChangedIn(val);
                                    },
                                    icon: const Icon(
                                        Icons.arrow_downward_rounded),
                                    iconSize: 24,
                                    elevation: 16,
                                    style: const TextStyle(color: Colors.blue),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.grey,
                                    ),
                                    items: classrooms.map((item) {
                                      return DropdownMenuItem(
                                        child: Text(item.classnumber),
                                        value: item.classnumber.toString(),
                                      );
                                    }).toList(),
                                  );
                                }
                              }
                            }),
                      ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text("Закуплено"),
                      FutureBuilder<List<Classroom>>(
                          future: httpService.getClassrooms(context),
                          builder: (BuildContext context,
                              AsyncSnapshot<List<Classroom>> snapshot) {
                            if (snapshot.connectionState !=
                                ConnectionState.done) {
                              return const SizedBox(
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                  ),
                                  height: 20.0,
                                  width: 20.0);
                            }
                            if (snapshot.hasData) {
                              if (snapshot.data != null) {
                                List<Classroom> classrooms = snapshot.data;
                                return DropdownButton<String>(
                                  value: dropdownValueGet,
                                  onChanged: (String val) {
                                    _onDropDownChangedGet(val);
                                  },
                                  icon:
                                      const Icon(Icons.arrow_downward_rounded),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: const TextStyle(color: Colors.blue),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.grey,
                                  ),
                                  items: classrooms.map((item) {
                                    return DropdownMenuItem(
                                      child: Text(item.classnumber),
                                      value: item.classnumber.toString(),
                                    );
                                  }).toList(),
                                );
                              }
                            }
                          }),
                    ],
                  )
                ],
              ),
              isActive: _currentStep >= 0,
              state:
                  _currentStep >= 0 ? StepState.complete : StepState.disabled,
            ),
            Step(
              title: const Text("Дата принятия к учету"),
              content: Column(children: <Widget>[
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                      "Выберите дату: ${pickedDate.day}.${pickedDate.month}.${pickedDate.year}"),
                  trailing: const Icon(Icons.keyboard_arrow_down),
                  onTap: _pickDate,
                )
              ]),
            ),
            Step(
                title: const Text("Оборудование"),
                //content: Text("Оборудование"),
                content: Column(
                  children: <Widget>[
                    const SizedBox(height: 10),
                    inventoryNumberField,
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Номер в аудитории"),
                        FutureBuilder<List<EquipmentNumbers>>(
                            future: httpService.getEquipmentNumber(inClassroom),
                            builder: (BuildContext context,
                                AsyncSnapshot<List<EquipmentNumbers>>
                                    snapshot) {
                              if (snapshot.connectionState !=
                                  ConnectionState.done) {
                                return const SizedBox(
                                    child: CircularProgressIndicator(
                                        strokeWidth: 3),
                                    height: 20.0,
                                    width: 20.0);
                              }
                              if (snapshot.hasData) {
                                if (snapshot.data != null) {
                                  List<EquipmentNumbers> equipmentNumbers =
                                      snapshot.data;
                                  return DropdownButton<String>(
                                    value: "$inClassroom-01",
                                    onChanged: (String val) {
                                      _onDropDownChangedNumber(val);
                                    },
                                    icon: const Icon(
                                        Icons.arrow_downward_rounded),
                                    iconSize: 24,
                                    elevation: 16,
                                    style: const TextStyle(color: Colors.blue),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.grey,
                                    ),
                                    items: equipmentNumbers.map((item) {
                                      return DropdownMenuItem(
                                          child: Text(item.equipmentnumber),
                                          value:
                                              item.equipmentnumber.toString());
                                    }).toList(),
                                  );
                                }
                              }
                            })
                      ],
                    ),
                  ],
                )),
            Step(
                title: const Text("Характеристики"),
                content: Column(
                  children: <Widget>[
                    TextFormField(
                        minLines: 1,
                        maxLines: 10,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 47, 167, 1.0),
                                  width: 2.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 47, 167, 1.0),
                                  width: 2.0)),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Принадлежность"), Text("выбор ")],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Выдано"), Text("да/нет ")],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Номер договора"), Text("да/нет ")],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Ответственное лицо"), Text("учитель ")],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text("Коментарий")],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        minLines: 1,
                        maxLines: 10,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 47, 167, 1.0),
                                  width: 2.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 47, 167, 1.0),
                                  width: 2.0)),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Преобретено по заявке"), Text("Да/нет")],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text("Разъемы в видеокарте")],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        minLines: 1,
                        maxLines: 10,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 47, 167, 1.0),
                                  width: 2.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 47, 167, 1.0),
                                  width: 2.0)),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text("Комментарий Чернега.А.М")],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        minLines: 1,
                        maxLines: 10,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 47, 167, 1.0),
                                  width: 2.0)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                  color: Color.fromRGBO(0, 47, 167, 1.0),
                                  width: 2.0)),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("ИФО"), Text("Ифо")],
                    ),
                  ],
                )),
          ],
        ))
      ]),
    );
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: pickedDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));

    if (date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }

  void _onDropDownChangedGet(String forClassroom) {
    setState(() {
      this.dropdownValueGet = forClassroom;
    });
  }

  void _onDropDownChangedIn(String inClassroom) {
    setState(() {
      this.dropdownValueIn = inClassroom;
      this.inClassroom = this.dropdownValueIn;
    });
  }

  void _onDropDownChangedNumber(String eqNumber) {
    setState(() {
      this.equipmentNumber = eqNumber;
    });
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  void continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  void cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
