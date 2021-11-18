// To parse this JSON data, do
//
//     final equipmentNumbers = equipmentNumbersFromJson(jsonString);

import 'dart:convert';

EquipmentNumbers equipmentNumbersFromJson(String str) =>
    EquipmentNumbers.fromJson(json.decode(str));

String equipmentNumbersToJson(EquipmentNumbers data) =>
    json.encode(data.toJson());

// List<EquipmentNumbers> parseNumbs(String responseBody) {
//   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

//   return parsed
//       .map<EquipmentNumbers>((json) => EquipmentNumbers.fromJson(json))
//       .toList();
// }

class EquipmentNumbers {
  EquipmentNumbers({
    this.id,
    this.equipmentnumber,
    this.classroom,
  });

  int id;
  String equipmentnumber;
  Classroom classroom;

  factory EquipmentNumbers.fromJson(Map<String, dynamic> json) =>
      EquipmentNumbers(
        id: json["id"],
        equipmentnumber: json["equipmentnumber"],
        classroom: Classroom.fromJson(json["classroom"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "equipmentnumber": equipmentnumber,
        "classroom": classroom.toJson(),
      };
}

class Classroom {
  Classroom({
    this.id,
    this.classnumber,
  });

  int id;
  String classnumber;

  factory Classroom.fromJson(Map<String, dynamic> json) => Classroom(
        id: json["id"],
        classnumber: json["classnumber"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "classnumber": classnumber,
      };
}
