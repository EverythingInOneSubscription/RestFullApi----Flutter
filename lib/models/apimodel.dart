// To parse this JSON data, do
//
//     final resapi = resapiFromJson(jsonString);

import 'dart:convert';

Resapi resapiFromJson(String str) => Resapi.fromJson(json.decode(str));

String resapiToJson(Resapi data) => json.encode(data.toJson());

class Resapi {
    Resapi({
        this.name,
        this.job,
        this.id,
        this.createdAt,
    });

    String name;
    String job;
    String id;
    DateTime createdAt;

    factory Resapi.fromJson(Map<String, dynamic> json) => Resapi(
        name: json["name"],
        job: json["job"],
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
        "id": id,
        "createdAt": createdAt.toIso8601String(),
    };
}
