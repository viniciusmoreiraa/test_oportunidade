import 'package:flutter/material.dart';
import 'package:genial_test/models/minha_carteira/detalhes_graficos_linhas_model.dart';
import 'package:genial_test/utils/style.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoRentabilidadeCarteiraCard extends StatefulWidget {
  final List<DetalhesGraficoLinhas> detalhesGraficoLinhas;

  const GraficoRentabilidadeCarteiraCard(
    this.detalhesGraficoLinhas, {
    Key key,
  }) : super(key: key);

  @override
  _GraficoRentabilidadeCarteiraCardState createState() =>
      _GraficoRentabilidadeCarteiraCardState();
}

class _GraficoRentabilidadeCarteiraCardState
    extends State<GraficoRentabilidadeCarteiraCard> {
  var isSelected = <bool>[true, false, false];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 66, left: 16, right: 16, top: 16),
            decoration: decorationCardShadowBlue(),
            width: 706,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 60,
                  child: Row(
                    children: [
                      listaBotoesPeriodo(
                        context,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: getDefaultAnimationChart(
                    true,
                    widget.detalhesGraficoLinhas,
                    0,
                    context,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget listaBotoesPeriodo(BuildContext context) {
    List<String> titleButton = ['no ano', 'no mês', 'desde o ínicio'];
    List<Widget> listBotoes = [];
    for (var index = 0; index < titleButton.length; index++) {
      listBotoes.add(Padding(
        padding: EdgeInsets.only(right: 8.0, left: 8.0, top: 24),
        child: _raisedButton(index, context, titleButton),
      ));
    }
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Row(children: listBotoes),
    );
  }

  RaisedButton _raisedButton(
      int index, BuildContext context, List<String> titleButton) {
    return RaisedButton(
        color:
            isSelected[index] ? Theme.of(context).primaryColor : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            18,
          ),
        ),
        onPressed: () {
          for (var i = 0; i < isSelected.length; i++) {
            if (index != i) {
              isSelected[i] = false;
            } else {
              isSelected[i] = true;
            }
            if (i + 1 == isSelected.length)
              setState(() {
                isSelected = isSelected;
              });
          }
        },
        child: Text(
          titleButton[index],
          style: styleW600(
            context: context,
            color: isSelected[index] ? Colors.white : Colors.black,
          ),
        ));
  }

  SfCartesianChart getDefaultAnimationChart(
      bool isTileView,
      List<DetalhesGraficoLinhas> dadosGrafico,
      int idPeriodoAtual,
      BuildContext context) {
    double maxIndice = 0;
    double minIndice = 0;

    dadosGrafico.map((item) {
      if (item.indiceCarteira > maxIndice) {
        maxIndice = item.indiceCarteira;
      }

      if (item.indiceCDI > maxIndice) {
        maxIndice = item.indiceCDI;
      }

      if (item.indiceIbov > maxIndice) {
        maxIndice = item.indiceIbov;
      }

      if (item.indicePoupanca > maxIndice) {
        maxIndice = item.indicePoupanca;
      }

      if (item.indiceCarteira < minIndice) {
        minIndice = item.indiceCarteira;
      }

      if (item.indiceCDI < minIndice) {
        minIndice = item.indiceCDI;
      }

      if (item.indiceIbov < minIndice) {
        minIndice = item.indiceIbov;
      }

      if (item.indicePoupanca < minIndice) {
        minIndice = item.indicePoupanca;
      }
    }).toList();

    return SfCartesianChart(
      margin: EdgeInsets.all(24),
      plotAreaBorderWidth: 0,
      trackballBehavior: TrackballBehavior(
          hideDelay: 3000,
          enable: true,
          activationMode: ActivationMode.singleTap,
          lineType: TrackballLineType.vertical,
          tooltipSettings: InteractiveTooltip(
            decimalPlaces: 4,
            format: 'series.name: point.y',
            borderColor: Colors.white,
            borderWidth: 2,
          )),
      legend: Legend(
          isVisible: true,
          position: LegendPosition.bottom,
          isResponsive: true,
          alignment: ChartAlignment.near,
          textStyle: styleW300(context: context, size: 13),
          title: LegendTitle(
            text: "Comparativos",
            textStyle: styleW400(size: 12, context: context),
            alignment: ChartAlignment.near,
          ),
          itemPadding: 10,
          padding: 10,
          iconWidth: 18,
          iconHeight: 18,
          iconBorderWidth: 2,
          toggleSeriesVisibility: true),
      primaryXAxis: DateTimeAxis(
          minorGridLines: MinorGridLines(
            width: 0,
          ),
          majorTickLines: MajorTickLines(size: 0, width: 0),
          minorTickLines: MinorTickLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          majorGridLines: MajorGridLines(
            width: 0,
          ),
          dateFormat: DateFormat("MMM\nyy"),
          labelStyle: styleW300(size: 12, context: context),
          tickPosition: TickPosition.inside,
          rangePadding: ChartRangePadding.auto,
          labelIntersectAction: AxisLabelIntersectAction.wrap),
      primaryYAxis: NumericAxis(
        minorGridLines: MinorGridLines(),
        numberFormat: NumberFormat.decimalPercentPattern(
            decimalDigits: 2, locale: 'pt_BR'),
        anchorRangeToVisiblePoints: true,
        isVisible: true,
        placeLabelsNearAxisLine: true,
        decimalPlaces: 2,
        desiredIntervals: 3,
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        majorTickLines: MajorTickLines(color: Colors.transparent),
        axisLine: AxisLine(color: Colors.transparent),
        rangePadding: ChartRangePadding.auto,
        majorGridLines: MajorGridLines(
            width: 1,
            dashArray: [
              3,
              5,
            ],
            color: Color(0xffECF0F4)),
      ),
      series: getDefaultAnimationSeries(
          isTileView, dadosGrafico, maxIndice, context),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  List<ChartSeries<_ChartSampleData, dynamic>> getDefaultAnimationSeries(
      bool isTileView,
      List<DetalhesGraficoLinhas> dadosGrafico,
      double maxRendimento,
      BuildContext context) {
    final List<_ChartSampleData> chartData = <_ChartSampleData>[];

    double carteiraAcu = 0;
    double cdiAcu = 0;
    double ibovAcu = 0;
    double poupancaAcu = 0;
    double indiceIPCAAcu = 0.0;
    dadosGrafico.forEach((dado) {
      carteiraAcu += dado.indiceCarteira;
      cdiAcu += dado.indiceCDI;
      ibovAcu += dado.indiceIbov;
      poupancaAcu += dado.indicePoupanca;
      indiceIPCAAcu += dado.indiceIPCA;

      return chartData.add(_ChartSampleData(
        x: DateTime.parse(dado.dtReferencia),
        y: carteiraAcu,
        yValue2: cdiAcu,
        yValue3: ibovAcu,
        yValue4: poupancaAcu,
        yValue5: indiceIPCAAcu,
      ));
    });

    return <ChartSeries<_ChartSampleData, DateTime>>[
      AreaSeries<_ChartSampleData, DateTime>(
        dataLabelSettings:
            DataLabelSettings(textStyle: styleW300(size: 12, context: context)),
        isVisibleInLegend: false,
        animationDuration: 2000,
        dataSource: chartData,
        color: Color(0xff364DCD),
        opacity: 0.30,
        // borderColor: Colors.blue,
        xValueMapper: (_ChartSampleData sales, _) => sales.x,
        yValueMapper: (_ChartSampleData sales, _) => sales.y,
        yAxisName: "yAxis1",
        name: 'Carteira',
      ),
      LineSeries<_ChartSampleData, DateTime>(
          markerSettings: MarkerSettings(
            isVisible: true,
            borderColor: Colors.white,
            color: Color(0xff1cbb1a),
            borderWidth: 2,
          ),
          selectionBehavior: SelectionBehavior(),
          enableTooltip: true,
          animationDuration: 4500,
          dataSource: chartData,
          width: 1,
          color: Color(0xff1CBB1A),
          xValueMapper: (_ChartSampleData sales, _) => sales.x,
          yValueMapper: (_ChartSampleData sales, _) => sales.yValue2,
          yAxisName: 'yAxis1',
          name: 'CDI'),
      LineSeries<_ChartSampleData, DateTime>(
          markerSettings: MarkerSettings(
            isVisible: true,
            borderColor: Colors.white,
            color: Color(0xff878787),
            borderWidth: 2,
          ),
          enableTooltip: true,
          animationDuration: 4500,
          dataSource: chartData,
          width: 1,
          color: Color(0xff878787),
          xValueMapper: (_ChartSampleData sales, _) => sales.x,
          yValueMapper: (_ChartSampleData sales, _) => sales.yValue3,
          yAxisName: 'yAxis1',
          name: 'IBOV'),
      LineSeries<_ChartSampleData, DateTime>(
          markerSettings: MarkerSettings(
            isVisible: true,
            borderColor: Colors.white,
            color: Color(0xffF20808),
            borderWidth: 2,
          ),
          enableTooltip: true,
          animationDuration: 4500,
          dataSource: chartData,
          width: 1,
          color: Color(0xffF20808),
          xValueMapper: (_ChartSampleData sales, _) => sales.x,
          yValueMapper: (_ChartSampleData sales, _) => sales.yValue4,
          yAxisName: 'yAxis1',
          name: 'Poupança'),
      LineSeries<_ChartSampleData, DateTime>(
          markerSettings: MarkerSettings(
            isVisible: true,
            borderColor: Colors.white,
            color: Color(0xff364DCD),
            borderWidth: 2,
          ),
          enableTooltip: true,
          animationDuration: 4500,
          dataSource: chartData,
          width: 1,
          color: Color(0xff364DCD),
          xValueMapper: (_ChartSampleData sales, _) => sales.x,
          yValueMapper: (_ChartSampleData sales, _) => sales.yValue5,
          yAxisName: 'yAxis1',
          name: 'IPCA')
    ];
  }
}

class _ChartSampleData {
  _ChartSampleData(
      {this.x,
      this.y,
      this.xValue,
      this.yValue2,
      this.yValue3,
      this.yValue4,
      this.yValue5,
      this.pointColor,
      this.size,
      this.text});
  final DateTime x;
  final num y;
  final dynamic xValue;
  final num yValue2;
  final num yValue3;
  final num yValue4;
  final num yValue5;
  final Color pointColor;
  final num size;
  final String text;
}
