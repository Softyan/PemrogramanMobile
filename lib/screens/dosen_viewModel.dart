import 'package:flutter/material.dart';
import '../data/dosen_repos.dart';
import '../data/viewstate.dart';
import '../model/bio_dosen.dart';

class DosenViewModel extends ChangeNotifier {
  final DosenRepos _dosenRepository = DosenRepositoryImpl();

  ViewState _state = ViewState.none;
  ViewState get state => _state;

  List<BioDosen> _listDosen = List.empty();
  List<BioDosen> get listDosen => _listDosen;

  String? _message;
  String? get message => _message;

  String? _errorMsg;
  String? get errorMsg => _errorMsg;

  _changeState(ViewState state) {
    _state = state;
    notifyListeners();
  }

  void getAllDosen() async {
    _changeState(ViewState.loading);
    var response = await _dosenRepository.getListDosen();
    var listDosen = response.data;

    _listDosen = listDosen ?? [];
    _changeState(ViewState.success);

    if (response.errorMessage != null) {
      _changeState(ViewState.error);
      _errorMsg = response.errorMessage;
    }
  }

  void addDosen(BioDosen dosen) async {
    _changeState(ViewState.loading);
    var response = await _dosenRepository.addDosen(dosen);

    _message = response.data;
    _changeState(ViewState.success);

    if (response.errorMessage != null) {
      _changeState(ViewState.error);
      _errorMsg = response.errorMessage;
    }
  }

  void deleteDosen(int id) async {
    _changeState(ViewState.loading);
    var response = await _dosenRepository.deleteDosen(id);

    _message = response.data;
    _changeState(ViewState.success);

    if (response.errorMessage != null) {
      _changeState(ViewState.error);
      _errorMsg = response.errorMessage;
    }
  }

  void updateDosen(BioDosen dosen) async {
    _changeState(ViewState.loading);
    var response = await _dosenRepository.updateDosen(dosen);

    _message = response.data;
    _changeState(ViewState.success);

    if (response.errorMessage != null) {
      _changeState(ViewState.error);
      _errorMsg = response.errorMessage;
    }
  }
}