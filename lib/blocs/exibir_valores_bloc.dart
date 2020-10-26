import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExibirValoresBloc extends ChangeNotifier {
  final String key = 'exibirValores';
  bool exibir = false;

  ExibirValoresBloc() {
    load();
  }

  setExibirValores(bool mudar) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, mudar);
    this.exibir = mudar;
    notifyListeners();
  }

  Future load() async {
    var prefs = await SharedPreferences.getInstance();
    var resultado = prefs.getBool(key);
    if (resultado == null) {
      prefs.setBool(key, false);
      exibir = false;
    }
  }
}
