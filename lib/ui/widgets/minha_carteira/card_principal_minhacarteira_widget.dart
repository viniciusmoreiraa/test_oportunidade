import 'package:flutter/material.dart';

import 'package:genial_test/models/chart_data.dart';
import 'package:genial_test/models/minha_carteira/minha_carteira_model.dart';
import 'package:genial_test/models/minha_carteira/produtos_carteira_model.dart';
import 'package:genial_test/utils/hexcolor.dart';
import 'package:genial_test/utils/style.dart';
import 'package:intl/intl.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

import 'card_interno_grafico_pizza_widget.dart';

class CardMinhaCarteiraGrafPizza extends StatelessWidget {
  final MinhaCarteiraModel data;

  const CardMinhaCarteiraGrafPizza({
    Key key,
    this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double cWidth = MediaQuery.of(context).size.width;
    final dadosChartPizza = data.produtosCarteira;
    final List<ChartData> chartData = [];

    if (dadosChartPizza != null) {
      chartData.clear();
      dadosChartPizza.map((index) {
        return chartData.add(ChartData(
          index.produto,
          index.porcentagemCarteira,
          HexColor(index.corHex),
        ));
      }).toList();
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: decorationCardShadowBlue(),
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            _header(context),
            buildGrafPizza(
              cWidth,
              chartData,
              context,
            ),
            buildLegendaGrafPizza(data),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Minha Carteira",
          style: styleH2(context: context, color: Colors.black),
        ),
        Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black,
        )
      ],
    );
  }

  Widget buildGrafPizza(
      double cWidth, List<ChartData> chartData, BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: decorationCircleInnerShadow(cWidth * 0.72),
            width: cWidth * 0.72,
            height: cWidth * 0.72,
          ),
          Container(
            child: SfCircularChart(
              margin: EdgeInsets.all(0),
              series: <CircularSeries>[
                DoughnutSeries<ChartData, String>(
                    dataSource: chartData,
                    pointColorMapper: (ChartData data, _) => data.color,
                    xValueMapper: (ChartData data, _) => data.x,
                    yValueMapper: (ChartData data, _) => data.y,
                    strokeWidth: cWidth * 0.9),
              ],
            ),
          ),
          CardInternoGraficoPizza(
            data: data,
          )
        ],
      ),
    );
  }

  buildLegendaGrafPizza(MinhaCarteiraModel data) {
    List<Widget> listWidgets = [];
    final formatPorcentagem = NumberFormat.percentPattern("pt_BR");
    data.produtosCarteira.forEach((element) {
      return listWidgets.add(Container(
        child: buildItemLegenda(element, formatPorcentagem),
      ));
    });

    return listWidgets.length > 3
        ? Column(children: [
            Row(
              children: listWidgets.sublist(0, 3),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: listWidgets.sublist(3),
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ])
        : Row(
            children: listWidgets,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          );
  }

  Widget buildItemLegenda(
      ProdutosCarteira element, NumberFormat formatPorcentagem) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(6),
          height: 4,
          width: 34,
          decoration: BoxDecoration(
            color: HexColor(element.corHex),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(
            element.produto,
            style: styleW400(),
          ),
        ),
        Text(
          "${formatPorcentagem.format(element.porcentagemCarteira)} | ${element.ativos.toString()} ativos",
          style: styleW300(),
        ),
      ],
    );
  }
}
