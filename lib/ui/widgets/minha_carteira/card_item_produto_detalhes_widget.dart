import 'package:flutter/material.dart';
import 'package:genial_test/blocs/exibir_valores_bloc.dart';
import 'package:genial_test/models/minha_carteira/produtos_carteira_model.dart';
import 'package:genial_test/utils/hexcolor.dart';
import 'package:genial_test/utils/style.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ItemProdutoDetalhesCard extends StatelessWidget {
  final ProdutosCarteira produto;

  ItemProdutoDetalhesCard({
    Key key,
    this.produto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<ExibirValoresBloc>(context);

    final f = NumberFormat.currency(
      locale: "pt_BR",
      name: "",
      symbol: "R\$",
    );
    return Container(
      width: 50,
      height: 171,
      decoration: _buildBoxDecoration(),
      margin: EdgeInsets.only(top: 17, left: 8, right: 8, bottom: 8),
      padding: EdgeInsets.all(24),
      child: _buildDadosCard(f, context, bloc),
    );
  }

  Column _buildDadosCard(NumberFormat f, BuildContext context, var bloc) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildNomeFundo(),
        _buildValor(f, context, bloc),
        _buildLinhaCinza(),
        _buildRowPorcentagem(context)
      ],
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      border: Border.all(color: Colors.black12),
      boxShadow: [
        BoxShadow(
          blurRadius: 2,
          color: Color(0xffffffff),
          offset: Offset(0, 0.5),
        )
      ],
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
    );
  }

  Container _buildNomeFundo() {
    return Container(
      decoration: BoxDecoration(
        color: HexColor(produto.corHex),
        borderRadius: BorderRadius.all(Radius.circular(19)),
      ),
      padding: EdgeInsets.only(left: 11, right: 11, top: 4, bottom: 2),
      height: 21,
      child: Text(
        produto.produto,
        textAlign: TextAlign.center,
        style: styleW700(),
      ),
    );
  }

  Widget _buildValor(
    NumberFormat f,
    BuildContext context,
    var bloc,
  ) {
    var exibir = bloc.exibir;

    return InkWell(
        onTap: () {
          bloc.setExibirValores(!exibir);
        },
        child: Column(
          children: [
            Text(
              exibir ? 'Ocultar valor' : 'Exibir valor',
              style: styleLinkButton(
                context: context,
                color: Colors.black,
                size: 12,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 4),
              alignment: Alignment.center,
              child: Text(
                exibir ? f.format(produto.valorPatrimonio) : "R\$ ************",
                style: styleDisplay(),
              ),
            ),
          ],
        ));
  }

  Container _buildLinhaCinza() {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: 170.5,
        color: Color(0xffdadada),
        height: 1,
      ),
    );
  }

  Container _buildRowPorcentagem(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildRentabilidade(
            "Mês",
            produto.rentabilidadeMes,
            context,
          ),
          _buildRentabilidade(
            "Ano",
            produto.rentabilidadeMes,
            context,
          ),
          _buildRentabilidade(
            "12 meses",
            produto.rentabilidadeMes,
            context,
          ),
        ],
      ),
    );
  }

  Column _buildRentabilidade(
      String title, double rentabilidade, BuildContext context) {
    final f = NumberFormat.percentPattern("pt_BR");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: styleW300(context: context, size: 12),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          "${rentabilidade > 0 ? '^' : '-'} ${f.format(rentabilidade)}",
          style: styleH2(
              context: context,
              color: rentabilidade > 0 ? Color(0xff1CBB1A) : Colors.red),
        )
      ],
    );
  }
}
