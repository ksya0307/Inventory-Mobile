import 'dart:convert';

Equipmentbelonging equipmentbelongingFromJson(String str) =>
    Equipmentbelonging.fromJson(json.decode(str));

String equipmentbelongingToJson(Equipmentbelonging data) =>
    json.encode(data.toJson());

class Equipmentbelonging {
  Equipmentbelonging({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory Equipmentbelonging.fromJson(Map<String, dynamic> json) =>
      Equipmentbelonging(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
