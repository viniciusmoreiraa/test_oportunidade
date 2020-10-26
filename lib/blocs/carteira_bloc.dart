import 'package:flutter/material.dart';
import 'package:genial_test/models/minha_carteira/minha_carteira_model.dart';
import 'package:genial_test/repositories/minha_carteira_respository.dart';

class CarteiraBloc extends ChangeNotifier {
  final carteiraRepository = new MinhaCarteiraRepository();

  CarteiraBloc() {
    carteiraGet();
  }

  MinhaCarteiraModel minhaCarteira;

  carteiraGet() {
    carteiraRepository.getCarteira().then((data) {
      this.minhaCarteira = data;
      notifyListeners();
    });
  }
}
