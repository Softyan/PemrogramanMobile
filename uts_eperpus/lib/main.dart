import 'package:flutter/material.dart';
import 'package:uts_eperpus/res/array.dart';
import 'detailbuku.dart';
import 'drawerscreen.dart';
import 'model/buku.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Buku Pinjol',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final List<Buku> listPinjam = [];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buku Pinjol"),
      ),
      drawer: DrawerScreen(
        listPinjam: listPinjam,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: listBuku
            .map((buku) => InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailBuku(
                                buku: buku,
                                listPinjam: listPinjam,
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
                          Text(buku.title),
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
