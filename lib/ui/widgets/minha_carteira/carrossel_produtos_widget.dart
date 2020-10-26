import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:genial_test/models/minha_carteira/produtos_carteira_model.dart';
import 'package:genial_test/utils/hexcolor.dart';

import 'card_item_produto_detalhes_widget.dart';

class CarrosselProdutosWidget extends StatefulWidget {
  final List<ProdutosCarteira> produtos;

  CarrosselProdutosWidget({Key key, this.produtos}) : super(key: key);

  @override
  _CarrosselProdutosWidgetState createState() =>
      _CarrosselProdutosWidgetState();
}

class _CarrosselProdutosWidgetState extends State<CarrosselProdutosWidget> {
  int _currentIndex = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> listWidget = [];
    widget.produtos.forEach((element) {
      return listWidget.add(ItemProdutoDetalhesCard(
        produto: element,
      ));
    });

    return Column(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            height: 200.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: listWidget.map((card) {
            return Builder(builder: (BuildContext context) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width,
                child: card,
              );
            });
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: map<Widget>(listWidget, (index, url) {
            return Container(
              width: _currentIndex == index ? 23.0 : 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(18)),
                color: _currentIndex == index
                    ? HexColor(widget.produtos[_currentIndex].corHex)
                    : Color(0xffE0E0E0),
              ),
            );
          }),
        ),
      ],
    );
  }
}
