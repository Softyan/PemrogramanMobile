import 'package:flutter/material.dart';
import 'package:uas/model/bio_dosen.dart';
import 'package:uas/utils/context_ext.dart';

import '../../../utils/app_route.dart';
import '../../edit/edit_screen.dart';

class ItemData extends StatelessWidget {
  final BioDosen dosen;
  final Function() onDismissed;
  final Function() onCancel;
  const ItemData(
      {Key? key,
        required this.dosen,
        required this.onDismissed,
        required this.onCancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {
        onDismissed;
        context.snackbar.showSnackBar(SnackBar(
          content: Text('Deleted ${dosen.nama}'),
          backgroundColor: Colors.redAccent,
          action: SnackBarAction(
            label: 'Cancel',
            onPressed: () => onCancel,
            textColor: Colors.white,
          ),
        ));
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Text(
                          dosen.nama,
                          textScaleFactor: 1,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Text(dosen.dosenid.toString(),
                        style: const TextStyle(color: Colors.grey),
                      ),
                      Text(dosen.lahir),
                      Text(dosen.email),
                      Text(dosen.nomor.toString()),
                      Text(dosen.fakultas),
                      Text(dosen.prodi),
                    ],
                  )),
              Expanded(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton (onPressed: () => AppRoute.to(EditScreen(
                        dosen: dosen,
                      )),
                      child: const Text('edit'))))
            ],
          ),
        ),
      ),
    );
  }
}