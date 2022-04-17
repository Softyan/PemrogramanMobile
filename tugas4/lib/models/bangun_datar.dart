class BangunDatar {
  String rumusKeliling() => '-';

  String rumusLuas() => '-';

  double hitungKeliling() => 0;

  double hitungLuas() => 0;
}

class Lingkaran extends BangunDatar {
  double jari;

  Lingkaran({this.jari = 0});

  @override
  String rumusKeliling() => '2 x π x r';

  @override
  String rumusLuas() => 'π x (d/2)²';

  @override
  double hitungKeliling() {
    double hasil = 0;
    if (jari % 7 == 0) {
      hasil = 2 * 22 * jari / 7;
    } else {
      hasil = 2 * 3.14 * jari;
    }
    return hasil;
  }

  @override
  double hitungLuas() {
    double hasil = 0;
    if (jari % 7 == 0) {
      hasil = 22 * (jari * jari) / 7;
    } else {
      hasil = 3.14 * (jari * jari);
    }
    return hasil;
  }
}

class BelahKetupat extends BangunDatar {
  double diagonal1, diagonal2, sisi, sisi2;
  bool isLayang;

  BelahKetupat(
      {this.diagonal1 = 0,
        this.diagonal2 = 0,
        this.sisi = 0,
        this.sisi2 = 0,
        required this.isLayang});

  @override
  String rumusKeliling() => '4 x s';

  @override
  String rumusLuas() => '1/2 x d1 x d2';

  @override
  double hitungKeliling() {
    double hasil = 0;
    if (!isLayang) {
      hasil = 4 * sisi;
    } else {
      hasil = 2 * (sisi + sisi2);
    }
    return hasil;
  }

  @override
  double hitungLuas() => (diagonal1 * diagonal2) / 2;
}

class Jajargenjang extends BangunDatar {
  double sisi1, sisi2, sisi3, alas, tinggi;

  Jajargenjang(
      {this.sisi1 = 0,
        this.sisi2 = 0,
        this.sisi3 = 0,
        this.alas = 0,
        this.tinggi = 0});

  @override
  String rumusKeliling() => 'AB + BC + CD + DE';

  @override
  String rumusLuas() => 'alas * tinggi';

  @override
  double hitungKeliling() => sisi1 + sisi2 + sisi3 + alas;

  @override
  double hitungLuas() => alas * tinggi;
}

class Trapesium extends BangunDatar {
  double sisi1, sisi2, atas, bawah, tinggi;

  Trapesium(
      {this.sisi1 = 0,
        this.sisi2 = 0,
        this.atas = 0,
        this.bawah = 0,
        this.tinggi = 0});

  @override
  String rumusKeliling() => 'AB + BC + CD + DE';

  @override
  String rumusLuas() => '((atas + bawah) x tinggi) / 2';

  @override
  double hitungKeliling() => sisi1 + sisi2 + atas + bawah;

  @override
  double hitungLuas() => ((atas + bawah) * tinggi) / 2;
}

class Segitiga extends BangunDatar {
  double sisi1, sisi2, alas, tinggi;

  Segitiga({this.sisi1 = 0, this.sisi2 = 0, this.alas = 0, this.tinggi = 0});

  @override
  String rumusKeliling() => 'AB + BC + CD';

  @override
  String rumusLuas() => '(alas x tinggi) / 2';

  @override
  double hitungKeliling() => sisi1 + sisi2 + alas;

  @override
  double hitungLuas() => (alas * tinggi) / 2;
}