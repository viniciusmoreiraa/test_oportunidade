import 'package:dio/dio.dart';
import 'package:genial_test/models/minha_carteira/minha_carteira_model.dart';
import 'package:genial_test/utils/settings.dart';

class MinhaCarteiraRepository {
  Future<MinhaCarteiraModel> getCarteira() async {
    var url = "${Settings.apiUrl}carteira";
    Response response = await Dio().get(url);
    if (response.statusCode == 200) {
      return MinhaCarteiraModel.fromJson(response.data);
    }
    return MinhaCarteiraModel();
  }
}
