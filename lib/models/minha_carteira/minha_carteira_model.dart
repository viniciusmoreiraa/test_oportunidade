import 'package:genial_test/models/minha_carteira/detalhes_graficos_linhas_model.dart';
import 'package:genial_test/models/minha_carteira/produtos_carteira_model.dart';

class MinhaCarteiraModel {
  int valorBruto;
  int qtdAtivos;
  double rentabilidadeCMes;
  double rentabilidadeCAno;
  double rentabilidadeC12M;
  List<ProdutosCarteira> produtosCarteira;
  List<DetalhesGraficoLinhas> detalhesGraficoLinhas;

  MinhaCarteiraModel(
      {this.valorBruto,
      this.qtdAtivos,
      this.rentabilidadeCMes,
      this.rentabilidadeCAno,
      this.rentabilidadeC12M,
      this.produtosCarteira,
      this.detalhesGraficoLinhas});

  MinhaCarteiraModel.fromJson(Map<String, dynamic> json) {
    valorBruto = json['valorBruto'];
    qtdAtivos = json['qtdAtivos'];
    rentabilidadeCMes = json['rentabilidadeCMes'];
    rentabilidadeCAno = json['rentabilidadeCAno'];
    rentabilidadeC12M = json['rentabilidadeC12M'];
    if (json['produtosCarteira'] != null) {
      produtosCarteira = new List<ProdutosCarteira>();
      json['produtosCarteira'].forEach((v) {
        produtosCarteira.add(new ProdutosCarteira.fromJson(v));
      });
    }
    if (json['detalhesGraficoLinhas'] != null) {
      detalhesGraficoLinhas = new List<DetalhesGraficoLinhas>();
      json['detalhesGraficoLinhas'].forEach((v) {
        detalhesGraficoLinhas.add(new DetalhesGraficoLinhas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['valorBruto'] = this.valorBruto;
    data['qtdAtivos'] = this.qtdAtivos;
    data['rentabilidadeCMes'] = this.rentabilidadeCMes;
    data['rentabilidadeCAno'] = this.rentabilidadeCAno;
    data['rentabilidadeC12M'] = this.rentabilidadeC12M;
    if (this.produtosCarteira != null) {
      data['produtosCarteira'] =
          this.produtosCarteira.map((v) => v.toJson()).toList();
    }
    if (this.detalhesGraficoLinhas != null) {
      data['detalhesGraficoLinhas'] =
          this.detalhesGraficoLinhas.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
