import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/buku.dart';

class DetailBuku extends StatefulWidget {
  final Buku buku;
  final List<Buku> listPinjam;

  const DetailBuku({Key? key, required this.buku, required this.listPinjam})
      : super(key: key);

  @override
  State<DetailBuku> createState() => _DetailBukuState();
}

class _DetailBukuState extends State<DetailBuku> {
  @override
  Widget build(BuildContext context) {
    final Buku buku = widget.buku;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Buku"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 150, child: Image.network(buku.coverlink)),
              Text(
                buku.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text("Penulis : ${buku.penulis}"),
              Text("Penerbit  : ${buku.penerbit}"),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Sinopsis",
                style: TextStyle(fontSize: 18),
              ),
              Text(buku.sinopsis),
              Text("Tahun Terbit :${buku.tahun}"),
              Text("Halaman   :${buku.halaman}"),
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title: const Text("Konfirmasi Peminjaman"),
                            content: const Text("Anda Yakin?"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Tidak")),
                              TextButton(
                                  onPressed: () async {
                                    var _listBuku = [buku];
                                    widget.listPinjam.add(buku);
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Ya")),
                            ],
                          );
                        });
                  },
                  child: const Text("Pinjam"))
            ],
          ),
        ),
      ),
    );
  }
}
