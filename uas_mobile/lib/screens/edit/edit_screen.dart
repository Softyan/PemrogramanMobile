import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:uas/model/bio_dosen.dart';
import 'package:uas/utils/context_ext.dart';

import 'components/default_dropdown_widget.dart';
import 'components/default_textfield_widget.dart';

class EditScreen extends StatefulWidget {
  final BioDosen? dosen;

  const EditScreen({Key? key, this.dosen}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final Size size = context.mediaSize;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text(
            widget.dosen != null ? 'Edit Data' : 'Add Data',
            style: const TextStyle(color: Colors.black),
          )),
      body: FormBuilder(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DefaultTextFieldWdiget(
                        id: 'name',
                        labelText: 'Name',
                        initialValue: widget.dosen?.nama,
                      ),
                      DefaultDropdownWidget(
                        id: 'fakultas',
                        items: const ['test1', 'test2'],
                        labelText: 'fakultas',
                        initialValue: widget.dosen?.fakultas,
                      ),
                      DefaultDropdownWidget(
                        id: 'prodi',
                        items: const ['test3', 'test4'],
                        labelText: 'Program Studi',
                        initialValue: widget.dosen?.prodi,
                      ),
                      DefaultTextFieldWdiget(
                        id: 'email',
                        labelText: 'Email',
                        validators: [FormBuilderValidators.email()],
                        initialValue: widget.dosen?.email,
                      ),
                      DefaultTextFieldWdiget(
                        id: 'tempatLahir',
                        labelText: 'Tempat Lahir',
                        initialValue: widget.dosen?.lahir,
                      ),
                      DefaultTextFieldWdiget(
                        id: 'nomorTelefon',
                        labelText: 'Nomor Telefon',
                        initialValue: widget.dosen?.nomor.toString(),
                      )
                    ],
                  )),
              Expanded(
                  child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: SizedBox(
                    width: size.width,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => _onClick(),
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ))),
                      child: const Text('Submit'),
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  _onClick() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final dosen = widget.dosen;
      var value = _formKey.currentState!.value;
      var name = value['name'];
      var fakultas = value['fakultas'];
      var programStudi = value['prodi'];
      var email = value['email'];
      var tempatLahir = value['tempatLahir'];
      var nomorTelefon = value['nomorTelefon'];
      var newDosen = BioDosen(
          id: 0,
          dosenid: 1,
          nama: name,
          fakultas: fakultas,
          prodi: programStudi,
          email: email,
          nomor: nomorTelefon,
          lahir: tempatLahir);

      if (dosen != null) {
        newDosen.id = dosen.id;
        newDosen.dosenid = dosen.dosenid;
      }
    }
  }
}
