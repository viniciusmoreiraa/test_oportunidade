class ProdutosCarteira {
  String produto;
  double porcentagemCarteira;
  int ativos;
  double rentabilidadeMes;
  double rentabilidadeAno;
  double rentabilidade12M;
  String corHex;
  int valorPatrimonio;

  ProdutosCarteira(
      {this.produto,
      this.porcentagemCarteira,
      this.ativos,
      this.rentabilidadeMes,
      this.rentabilidadeAno,
      this.rentabilidade12M,
      this.corHex,
      this.valorPatrimonio});

  ProdutosCarteira.fromJson(Map<String, dynamic> json) {
    produto = json['produto'];
    porcentagemCarteira = json['porcentagemCarteira'];
    ativos = json['ativos'];
    rentabilidadeMes = json['rentabilidadeMes'];
    rentabilidadeAno = json['rentabilidadeAno'];
    rentabilidade12M = json['rentabilidade12M'];
    corHex = json['corHex'];
    valorPatrimonio = json['valorPatrimonio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['produto'] = this.produto;
    data['porcentagemCarteira'] = this.porcentagemCarteira;
    data['ativos'] = this.ativos;
    data['rentabilidadeMes'] = this.rentabilidadeMes;
    data['rentabilidadeAno'] = this.rentabilidadeAno;
    data['rentabilidade12M'] = this.rentabilidade12M;
    data['corHex'] = this.corHex;
    data['valorPatrimonio'] = this.valorPatrimonio;
    return data;
  }
}
