import 'package:flutter/material.dart';
import 'package:genial_test/blocs/exibir_valores_bloc.dart';
import 'package:genial_test/models/minha_carteira/minha_carteira_model.dart';
import 'package:genial_test/utils/style.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CardInternoGraficoPizza extends StatelessWidget {
  final MinhaCarteiraModel data;

  const CardInternoGraficoPizza({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<ExibirValoresBloc>(context);
    bool exibirValores = bloc.exibir;
    final double cWidth = MediaQuery.of(context).size.width;
    final formatMoney = NumberFormat.currency(
      locale: "pt_BR",
      name: "",
    );
    return GestureDetector(
        onTap: () => bloc.setExibirValores(!exibirValores),
        child: Container(
          decoration: decorationCircleShadowBlue(),
          width: cWidth * 0.52,
          height: cWidth * 0.52,
          padding: EdgeInsets.only(top: cWidth * 0.05, bottom: cWidth * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                exibirValores ? 'Ocultar valor' : 'Exibir valor',
                style: styleLinkButton(
                  context: context,
                  color: Colors.black,
                  size: 12,
                ),
              ),
              Text(
                  "R\$ ${exibirValores ? formatMoney.format(data.valorBruto) : '************'}",
                  style: styleH2(context: context, color: Colors.black)),
              Text("${data.qtdAtivos.toString()} ATIVOS", style: styleW300()),
              Container(
                height: 1,
                color: Color(0xffdadada),
                width: cWidth * 0.35,
              ),
              Text(
                'Valor total bruto',
                style: styleW300(),
              )
            ],
          ),
        ));
  }
}
