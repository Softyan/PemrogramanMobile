import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tugas4/models/bangun_datar.dart';

class InputWidget extends StatefulWidget {
  final String selectedItem;
  final void Function(BangunDatar) bangunDatar;
  const InputWidget({
    Key? key,
    required this.selectedItem,
    required this.bangunDatar,
  }) : super(key: key);

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLayang = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FormBuilder(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Container(
          width: 200,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              _searchInput(widget.selectedItem),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: size.width,
                child: ElevatedButton(
                    onPressed: () => setState(() {
                      _onSubmit(widget.selectedItem);
                    }),
                    child: const Text('Hitung',style: TextStyle(color: Colors.yellow))),
              ), const SizedBox(height: 10,)
            ],
          ),
        ));
  }

  Widget _searchInput(String selectedItem) {
    switch (selectedItem.toLowerCase()) {
      case 'lingkaran':
        return _inputLingkaran();
      case 'belah ketupat':
        return _inputBelahKetupat(false);
      case 'layang-layang':
        return _inputBelahKetupat(true);
      case 'jajargenjang':
        return _inputTrapesium();
      case 'trapesium':
        return _inputTrapesium();
      case 'segitiga':
        return _inputSegitiga();
      default:
        return Container(
          width: 200,
          height: 200,
          color: Colors.red,
          child: const Center(child: Text('Belum ada')),
        );
    }
  }

  _inputLingkaran() => FormBuilderTextField(
    name: 'jari',
    keyboardType: TextInputType.number,
    textAlign: TextAlign.center,
    decoration: const InputDecoration(hintText: 'Masukkan jari-jari',enabledBorder:OutlineInputBorder() ),
    validator: (value) {
      String input = value ?? '0';
      if (input.isEmpty) {
        return 'Tidak boleh kosong';
      }
      return null;
    },
  );

  _inputBelahKetupat(bool isLayang) {
    _isLayang = isLayang;
    return Column(
      children: [
        FormBuilderTextField(
          name: 'sisi',
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(hintText: 'Masukkan sisi',enabledBorder:OutlineInputBorder()),
          validator: (value) {
            String input = value ?? '0';
            if (input.isEmpty) {
              return 'Tidak boleh kosong';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        FormBuilderTextField(
          name: 'sisi2',
          enabled: isLayang,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(hintText: 'Masukkan sisi2',enabledBorder:OutlineInputBorder()),
          validator: (value) {
            String input = value ?? '0';
            if (input.isEmpty) {
              return 'Tidak boleh kosong';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        FormBuilderTextField(
          name: 'diagonal1',
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(hintText: 'Masukkan diagonal1',enabledBorder:OutlineInputBorder()),
          validator: (value) {
            String input = value ?? '0';
            if (input.isEmpty) {
              return 'Tidak boleh kosong';
            }
            return null;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        FormBuilderTextField(
          name: 'diagonal2',
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(hintText: 'Masukkan diagonal2',enabledBorder:OutlineInputBorder()),
          validator: (value) {
            String input = value ?? '0';
            if (input.isEmpty) {
              return 'Tidak boleh kosong';
            }
            return null;
          },
        )
      ],
    );
  }

  _inputTrapesium() => Column(
    children: [
      FormBuilderTextField(
        name: 'sisi',
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(hintText: 'Masukkan sisi',enabledBorder:OutlineInputBorder()),
        validator: (value) {
          String input = value ?? '0';
          if (input.isEmpty) {
            return 'Tidak boleh kosong';
          }
          return null;
        },
      ),
      const SizedBox(
        height: 10,
      ),
      FormBuilderTextField(
        name: 'sisi2',
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(hintText: 'Masukkan sisi2',enabledBorder:OutlineInputBorder()),
        validator: (value) {
          String input = value ?? '0';
          if (input.isEmpty) {
            return 'Tidak boleh kosong';
          }
          return null;
        },
      ),
      const SizedBox(
        height: 10,
      ),
      FormBuilderTextField(
        name: 'sisi3',
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(hintText: 'Masukkan sisi3',enabledBorder:OutlineInputBorder()),
        validator: (value) {
          String input = value ?? '0';
          if (input.isEmpty) {
            return 'Tidak boleh kosong';
          }
          return null;
        },
      ),
      const SizedBox(
        height: 10,
      ),
      FormBuilderTextField(
        name: 'sisi4',
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(hintText: 'Masukkan sisi4',enabledBorder:OutlineInputBorder()),
        validator: (value) {
          String input = value ?? '0';
          if (input.isEmpty) {
            return 'Tidak boleh kosong';
          }
          return null;
        },
      ),
      const SizedBox(
        height: 10,
      ),
      FormBuilderTextField(
        name: 'tinggi',
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(hintText: 'Masukkan tinggi',enabledBorder:OutlineInputBorder()),
        validator: (value) {
          String input = value ?? '0';
          if (input.isEmpty) {
            return 'Tidak boleh kosong';
          }
          return null;
        },
      )
    ],
  );
  _inputSegitiga() => Column(
    children: [
      FormBuilderTextField(
        name: 'sisi',
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(hintText: 'Masukkan sisi',enabledBorder:OutlineInputBorder()),
        validator: (value) {
          String input = value ?? '0';
          if (input.isEmpty) {
            return 'Tidak boleh kosong';
          }
          return null;
        },
      ),
      const SizedBox(
        height: 10,
      ),
      FormBuilderTextField(
        name: 'sisi2',
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(hintText: 'Masukkan sisi2',enabledBorder:OutlineInputBorder()),
        validator: (value) {
          String input = value ?? '0';
          if (input.isEmpty) {
            return 'Tidak boleh kosong';
          }
          return null;
        },
      ),
      const SizedBox(
        height: 10,
      ),
      FormBuilderTextField(
        name: 'sisi3',
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(hintText: 'Masukkan sisi3',enabledBorder:OutlineInputBorder()),
        validator: (value) {
          String input = value ?? '0';
          if (input.isEmpty) {
            return 'Tidak boleh kosong';
          }
          return null;
        },
      ),
      const SizedBox(
        height: 10,
      ),
      FormBuilderTextField(
        name: 'tinggi',
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(hintText: 'Masukkan tinggi',enabledBorder:OutlineInputBorder()),
        validator: (value) {
          String input = value ?? '0';
          if (input.isEmpty) {
            return 'Tidak boleh kosong';
          }
          return null;
        },
      )
    ],
  );

  void _onSubmit(String selectedItem) {
    _formKey.currentState?.save();
    if (_formKey.currentState!.validate()) {
      BangunDatar bangunDatar = BangunDatar();
      switch (selectedItem.toLowerCase()) {
        case 'lingkaran':
          String jari = _formKey.currentState?.value['jari']??'0';
          bangunDatar = Lingkaran(jari: toInt(jari).toDouble());
          widget.bangunDatar(bangunDatar);
          break;
        case 'trapesium':
          String sisi = _formKey.currentState?.value['sisi']??'0';
          String sisi2 = _formKey.currentState?.value['sisi2']??'0';
          String sisi3 = _formKey.currentState?.value['sisi3']??'0';
          String sisi4 = _formKey.currentState?.value['sisi4']??'0';
          String tinggi = _formKey.currentState?.value['tinggi']??'0';
          bangunDatar = Trapesium(
              sisi1: toInt(sisi).toDouble(),
              sisi2: toInt(sisi2).toDouble(),
              atas: toInt(sisi3).toDouble(),
              bawah: toInt(sisi4).toDouble(),
              tinggi: toInt(tinggi).toDouble());
          widget.bangunDatar(bangunDatar);
          break;
        case 'jajargenjang':
          String sisi = _formKey.currentState?.value['sisi']??'0';
          String sisi2 = _formKey.currentState?.value['sisi2']??'0';
          String sisi3 = _formKey.currentState?.value['sisi3']??'0';
          String sisi4 = _formKey.currentState?.value['sisi4']??'0';
          String tinggi = _formKey.currentState?.value['tinggi']??'0';
          bangunDatar = Jajargenjang(
              sisi1: toInt(sisi).toDouble(),
              sisi2: toInt(sisi2).toDouble(),
              sisi3: toInt(sisi3).toDouble(),
              alas: toInt(sisi4).toDouble(),
              tinggi: toInt(tinggi).toDouble());
          widget.bangunDatar(bangunDatar);
          break;

        case 'segitiga':
          String sisi = _formKey.currentState?.value['sisi']??'0';
          String sisi2 = _formKey.currentState?.value['sisi2']??'0';
          String sisi3 = _formKey.currentState?.value['sisi3']??'0';
          String tinggi = _formKey.currentState?.value['tinggi']??'0';
          bangunDatar = Segitiga(
              sisi1: toInt(sisi).toDouble(),
              sisi2: toInt(sisi2).toDouble(),
              alas: toInt(sisi3).toDouble(),
              tinggi: toInt(tinggi).toDouble());
          widget.bangunDatar(bangunDatar);
          break;
        default:
          String sisi = _formKey.currentState?.value['sisi']??'0';
          String sisi2 = _formKey.currentState?.value['sisi2']??'0';
          String diagonal1 = _formKey.currentState?.value['diagonal1']??'0';
          String diagonal2 = _formKey.currentState?.value['diagonal2']??'0';
          bangunDatar = BelahKetupat(
              sisi: toInt(sisi).toDouble(),
              sisi2: toInt(sisi2).toDouble(),
              diagonal1: toInt(diagonal1).toDouble(),
              diagonal2: toInt(diagonal2).toDouble(),
              isLayang: _isLayang);
          widget.bangunDatar(bangunDatar);
      }
    } else {
      log("validation failed");
    }
  }

  int toInt(String input) {
    try {
      return int.parse(input);
    } catch (e) {
      return 0;
    }
  }
}