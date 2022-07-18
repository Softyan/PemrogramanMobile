import 'dart:convert';
import 'bio_dosen.dart';

DosenResponse dosenResponseFromJson(String str) =>
    DosenResponse.fromJson(json.decode(str));

String dosenResponseToJson(DosenResponse data) => json.encode(data.toJson());

class DosenResponse {
  DosenResponse({
    required this.message,
    required this.data,
  });

  String message;
  List<BioDosen> data;

  factory DosenResponse.fromJson(Map<String, dynamic> json) => DosenResponse(
    message: json["message"],
    data: List<BioDosen>.from(json["data"].map((x) => BioDosen.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}