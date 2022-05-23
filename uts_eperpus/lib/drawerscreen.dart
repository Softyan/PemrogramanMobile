import 'package:flutter/material.dart';
import 'package:uts_eperpus/rakbuku.dart';

import 'model/buku.dart';

class DrawerScreen extends StatelessWidget {
  final List<Buku> listPinjam;

  const DrawerScreen({Key? key, required this.listPinjam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String nama = 'Sofyan Wahyu Anggoro';
    const String nim = '20190801130';
    const String background =
        'https://cdn.discordapp.com/attachments/676064580622876683/965132212846592020/download.jpg';
    return Drawer(
      backgroundColor: Colors.green,
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(background))),
              accountName: Text(
                '',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              accountEmail: Text(
                '',
                style: TextStyle(fontSize: 12, color: Colors.white),
              )),
          const Padding(
            padding: EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Card(
              elevation: 30,
              child: ListTile(
                title: Text('Nama'),
                subtitle: Text(nama),
                leading: Icon(Icons.person),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Card(
              elevation: 30,
              child: ListTile(
                title: Text('NIM'),
                subtitle: Text(nim),
                leading: Icon(Icons.numbers),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Card(
              elevation: 30,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RakBuku(
                              listPinjam: listPinjam,
                            )),
                  );
                },
                title: const Text('Rak Buku'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
