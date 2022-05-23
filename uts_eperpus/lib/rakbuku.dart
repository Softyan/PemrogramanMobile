import 'package:flutter/material.dart';

import 'detailbuku.dart';
import 'model/buku.dart';

class RakBuku extends StatefulWidget {
  final List<Buku> listPinjam;

  const RakBuku({Key? key, required this.listPinjam}) : super(key: key);

  @override
  State<RakBuku> createState() => _RakBukuState();
}

class _RakBukuState extends State<RakBuku> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rak Buku"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: widget.listPinjam
            .map((buku) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailBuku(
                                buku: buku,
                                listPinjam: widget.listPinjam,
                              )),
                    );
                  },
                  child: SizedBox(
                    height: 200,
                    child: Card(
                      elevation: 20,
                      child: Column(
                        children: [
                          SizedBox(
                              height: 150,
                              child: Image.network(buku.coverlink)),
                          Text(buku.title)
                        ],
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
