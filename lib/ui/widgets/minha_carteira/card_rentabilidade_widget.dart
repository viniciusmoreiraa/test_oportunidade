import 'package:flutter/material.dart';
import 'package:genial_test/utils/style.dart';
import 'package:intl/intl.dart';

class CardRentabilidadeCarteira extends StatelessWidget {
  final double rMes;
  final double rAno;
  final double r12M;

  const CardRentabilidadeCarteira({Key key, this.rMes, this.rAno, this.r12M})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formater = NumberFormat("00.00", "pt_BR");

    return Container(
      width: 400,
      height: 140,
      // color: Colors.red,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: ClampingScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            width: 400,
            height: 108,
            decoration: decorationCardShadowBlue(),
            child: buildConteudo(formater, context),
          )
        ],
      ),
    );
  }

  Row buildConteudo(NumberFormat formater, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        buildItem("Rentabilidade\nMês", rMes, formater, context),
        buildDivisor(),
        buildItem("Rentabilidade\nAno", rAno, formater, context),
        buildDivisor(),
        buildItem("Rentabilidade\n12 meses", r12M, formater, context),
      ],
    );
  }

  Container buildDivisor() {
    return Container(
      height: 56.5,
      width: 1,
      color: Color(0xffdadada),
    );
  }

  Widget buildItem(String text, double rentabilidade, NumberFormat formater,
      BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: styleW400(),
          ),
          Text(
            " ${rMes > 0 ? '+' : '-'} ${formater.format(rMes * 100)}%",
            style: styleH2(
                color: rMes > 0 ? Color(0xff1cbb1a) : Colors.red,
                context: context),
          ),
        ],
      ),
    );
  }
}
