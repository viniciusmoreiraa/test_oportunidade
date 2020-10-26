class DetalhesGraficoLinhas {
  String dtReferencia;
  double indiceCDI;
  double indicePoupanca;
  double indiceIbov;
  double indiceCarteira;
  double indiceIPCA;

  DetalhesGraficoLinhas({
    this.dtReferencia,
    this.indiceCDI,
    this.indicePoupanca,
    this.indiceIbov,
    this.indiceCarteira,
    this.indiceIPCA,
  });

  DetalhesGraficoLinhas.fromJson(Map<String, dynamic> json) {
    dtReferencia = json['dtReferencia'];
    indiceCDI = json['indiceCDI'];
    indicePoupanca = json['indicePoupanca'];
    indiceIbov = json['indiceIbov'];
    indiceCarteira = json['indiceCarteira'];
    indiceIPCA = json['indiceIPCA'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dtReferencia'] = this.dtReferencia;
    data['indiceCDI'] = this.indiceCDI;
    data['indicePoupanca'] = this.indicePoupanca;
    data['indiceIbov'] = this.indiceIbov;
    data['indiceCarteira'] = this.indiceCarteira;
    data['indiceIPCA'] = this.indiceIPCA;
    return data;
  }
}
