import 'dart:convert';

class BioDosen {
  int id;
  int dosenid;
  String nama;
  String fakultas;
  String prodi;
  String email;
  String lahir;
  int nomor;

  BioDosen({
    required this.id,
    required this.dosenid,
    required this.nama,
    required this.fakultas,
    required this.prodi,
    required this.email,
    required this.lahir,
    required this.nomor,
  });

  factory BioDosen.fromJson(Map<String, dynamic> json) => BioDosen(
    id: json["id"],
    dosenid: json["dosenid"],
    nama: json["nama"],
    fakultas: json["fakultas"],
    prodi: json["prodi"],
    email: json["email"],
    nomor: json["nomor"],
    lahir: json["lahir"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "dosenid": dosenid,
    "nama": nama,
    "fakultas": fakultas,
    "prodi": prodi,
    "email": email,
    "nomor": nomor,
    "lahir": lahir,
  };

  @override
  String toString() {
    return 'BioDosen(id: $id, BioDosenId: $dosenid, name: $nama, rumpun: $fakultas, programStudy: $prodi, email: $email, tempatLahir $lahir,nomorTelefon $nomor)';
  }
}
