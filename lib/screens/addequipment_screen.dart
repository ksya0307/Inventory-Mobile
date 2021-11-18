// ignore_for_file: use_key_in_widget_constructors, missing_return, unnecessary_this, prefer_const_literals_to_create_immutables, deprecated_member_use, unused_local_variable

//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myhands/http_service.dart';
import 'package:myhands/models/computernumbers_model.dart';
import 'package:myhands/models/equipmentbelonging_model.dart';
import 'package:myhands/models/teacher_model.dart';

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

  //dropdown menu
  String given = 'Да';
  String isApplication = 'Да';
  String belonging = 'Учебно-лабораторное оборудование';
  String dropdownValueGet = '109'; //закуплено
  String dropdownValueIn = '109'; //распределено
  String inClassroom; //
  String equipmentNumber;
  String respTeacher;

  //контроллеры
  final controllerInventoryNumber = TextEditingController();
  final controllerNumberInClassroom = TextEditingController();
  final controllerDocument = TextEditingController();
  final controllerInfo = TextEditingController();
  final controllerComment = TextEditingController();
  final controllerChernega = TextEditingController();
  final controllerPorts = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //текстовые поля
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
    final info = TextFormField(
        controller: controllerInfo,
        minLines: 1,
        maxLines: 20,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          labelText: "Информация об оборудовании",
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                  color: Color.fromRGBO(0, 47, 167, 1.0), width: 2.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                  color: Color.fromRGBO(0, 47, 167, 1.0), width: 2.0)),
        ));
    final document = TextFormField(
      controller: controllerDocument,
      autofocus: false,
      textAlign: TextAlign.start,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
      ],
      keyboardType:
          const TextInputType.numberWithOptions(signed: false, decimal: false),
      decoration: InputDecoration(
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
    final comment = TextFormField(
        controller: controllerComment,
        minLines: 1,
        maxLines: 20,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          labelText: "Информация об оборудовании",
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                  color: Color.fromRGBO(0, 47, 167, 1.0), width: 2.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                  color: Color.fromRGBO(0, 47, 167, 1.0), width: 2.0)),
        ));
    final ports = TextFormField(
        controller: controllerPorts,
        minLines: 1,
        maxLines: 20,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          labelText: "Информация об оборудовании",
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                  color: Color.fromRGBO(0, 47, 167, 1.0), width: 2.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                  color: Color.fromRGBO(0, 47, 167, 1.0), width: 2.0)),
        ));
    final commentChernega = TextFormField(
        controller: controllerChernega,
        minLines: 1,
        maxLines: 20,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          labelText: "Информация об оборудовании",
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                  color: Color.fromRGBO(0, 47, 167, 1.0), width: 2.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                  color: Color.fromRGBO(0, 47, 167, 1.0), width: 2.0)),
        ));
    //выпадающие списки
    final dropDownMenuBelonging = FutureBuilder<List<Equipmentbelonging>>(
      future: httpService.getBelongings(),
      builder: (BuildContext context,
          AsyncSnapshot<List<Equipmentbelonging>> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox(
              child: CircularProgressIndicator(strokeWidth: 3),
              height: 20.0,
              width: .0);
        }
        if (snapshot.hasData) {
          if (snapshot.data != null) {
            List<Equipmentbelonging> equipmentBelonging = snapshot.data;
            return DropdownButton<String>(
              alignment: Alignment.bottomLeft,
              value: belonging,
              onChanged: (String val) {
                _onDropDownChangedBelonging(val);
              },
              icon: const Icon(Icons.arrow_downward_rounded),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.blue, fontSize: 12),
              underline: Container(
                height: 2,
                color: Colors.grey,
              ),
              items: equipmentBelonging.map((item) {
                return DropdownMenuItem(
                    child: Text(item.name), value: item.name.toString());
              }).toList(),
            );
          }
        }
      },
    );
    final dropDownMenuGiven = DropdownButton<String>(
      value: given,
      icon: const Icon(Icons.arrow_downward_rounded),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.blue),
      underline: Container(
        height: 2,
        color: Colors.grey,
      ),
      onChanged: (String newValue) {
        setState(() {
          given = newValue;
        });
      },
      items:
          <String>['Да', 'Нет'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
    final dropDownMenuEqNumbs = FutureBuilder<List<EquipmentNumbers>>(
        future: httpService.getEquipmentNumber(inClassroom),
        builder: (BuildContext context,
            AsyncSnapshot<List<EquipmentNumbers>> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const SizedBox(
                child: CircularProgressIndicator(strokeWidth: 3),
                height: 20.0,
                width: 20.0);
          }
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              List<EquipmentNumbers> equipmentNumbers = snapshot.data;
              return DropdownButton<String>(
                value: "$inClassroom-01",
                onChanged: (String val) {
                  _onDropDownChangedNumber(val);
                },
                icon: const Icon(Icons.arrow_downward_rounded),
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
                      value: item.equipmentnumber.toString());
                }).toList(),
              );
            }
          }
        });
    final dropDownMenuForCl = FutureBuilder<List<Classroom>>(
        future: httpService.getClassrooms(context),
        builder:
            (BuildContext context, AsyncSnapshot<List<Classroom>> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
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
                icon: const Icon(Icons.arrow_downward_rounded),
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
        });
    final dropDownMenuInCl = FutureBuilder<List<Classroom>>(
        future: httpService.getClassrooms(context),
        builder:
            (BuildContext context, AsyncSnapshot<List<Classroom>> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
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
                icon: const Icon(Icons.arrow_downward_rounded),
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
        });
    final dropDownMenuTeacher = FutureBuilder<List<Teacher>>(
        future: httpService.getTeachers(context),
        builder: (BuildContext context, AsyncSnapshot<List<Teacher>> snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const SizedBox(
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                ),
                height: 20.0,
                width: 20.0);
          }
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              List<Teacher> teachers = snapshot.data;
              return DropdownButton<String>(
                alignment: Alignment.bottomLeft,
                value: respTeacher,
                onChanged: (String val) {
                  _onDropDownChangedTeacher(val);
                },
                icon: const Icon(Icons.arrow_downward_rounded),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Colors.blue),
                underline: Container(
                  height: 2,
                  color: Colors.grey,
                ),
                items: teachers.map((item) {
                  String ln = item.lastname;
                  String fn = item.firstname;
                  String sn = item.secondname;
                  fn = fn[0];
                  sn = sn[0];

                  return DropdownMenuItem(
                    child: Text("$ln $fn. $sn."),
                    value: item.id.toString(),
                  );
                }).toList(),
              );
            }
          }
        });

    final dropDownMenuIsApplication = DropdownButton<String>(
      value: isApplication,
      icon: const Icon(Icons.arrow_downward_rounded),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.blue),
      underline: Container(
        height: 2,
        color: Colors.grey,
      ),
      onChanged: (String newValue) {
        setState(() {
          isApplication = newValue;
        });
      },
      items:
          <String>['Да', 'Нет'].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
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
                      children: [const Text("Распределено"), dropDownMenuInCl]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text("Закуплено"),
                      dropDownMenuForCl
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
                        dropDownMenuEqNumbs
                      ],
                    ),
                  ],
                )),
            Step(
                title: const Text("Характеристики"),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 15,
                    ),
                    info,
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Принадлежность",
                    ),
                    dropDownMenuBelonging,
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Выдано"), dropDownMenuGiven],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text("Номер договора"),
                    const SizedBox(
                      height: 15,
                    ),
                    document,
                    const SizedBox(
                      height: 15,
                    ),
                    Text("Ответственное лицо"),
                    dropDownMenuTeacher,
                    const SizedBox(
                      height: 15,
                    ),
                    Text("Комментарий"),
                    comment,
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Преобретено по заявке"),
                        dropDownMenuIsApplication
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text("Разъемы в видеокарте"), ports],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text("Комментарий Чернега.А.М"),
                    commentChernega,
                    const SizedBox(
                      height: 10,
                    ),
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

  void _onDropDownChangedBelonging(String belong) {
    setState(() {
      this.belonging = belong;
    });
  }

  void _onDropDownChangedTeacher(String teacher) {
    setState(() {
      this.respTeacher = teacher;
    });
  }
}
