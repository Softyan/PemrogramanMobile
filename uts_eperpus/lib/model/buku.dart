import 'dart:convert';

List<Buku> bukuFromJson(String str) =>
    List<Buku>.from(json.decode(str).map((x) => Buku.fromJson(x)));

String bukuToJson(List<Buku> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Buku {
  String title, sinopsis, penulis, coverlink, penerbit;
  int tahun, halaman;

  Buku({
    required this.title,
    required this.sinopsis,
    required this.penulis,
    required this.coverlink,
    required this.penerbit,
    required this.tahun,
    required this.halaman,
  });

  factory Buku.fromJson(Map<String, dynamic> json) => Buku(
      title: json["title"] ?? '',
      sinopsis: json["sinopsis"] ?? '',
      penulis: json["penulis"] ?? '',
      coverlink: json["coverlink"] ?? '',
      penerbit: json["penerbit"] ?? '',
      tahun: json["tahun"] ?? '',
      halaman: json["halaman"] ?? '');
  Map<String, dynamic> toJson() => {
    "title": title,
    "sinopsis": sinopsis,
    "penulis": penulis,
    "coverlink": coverlink,
    "penerbit":penerbit,
    "tahun":tahun,
    "halaman":halaman,
  };
}
