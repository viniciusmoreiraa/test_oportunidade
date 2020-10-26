import 'package:flutter/material.dart';
import 'package:genial_test/blocs/carteira_bloc.dart';
import 'package:genial_test/models/minha_carteira/minha_carteira_model.dart';
import 'package:genial_test/ui/widgets/loader_widget.dart';
import 'package:genial_test/ui/widgets/minha_carteira/card_grafico_rentabilidade_carteira_widget.dart';

import 'package:genial_test/ui/widgets/minha_carteira/card_principal_minhacarteira_widget.dart';
import 'package:genial_test/ui/widgets/minha_carteira/card_rentabilidade_widget.dart';
import 'package:genial_test/ui/widgets/minha_carteira/carrossel_produtos_widget.dart';
import 'package:genial_test/ui/widgets/minha_carteira/title_component_widget.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CarteiraTabView extends StatelessWidget {
  MinhaCarteiraModel carteira = new MinhaCarteiraModel();

  var bloc;

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<CarteiraBloc>(context);

    carteira = bloc.minhaCarteira;
    return Loader(object: bloc.minhaCarteira, callback: buildListView);
  }

  buildListView() {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        CardMinhaCarteiraGrafPizza(
          data: carteira,
        ),
        TitleComponentText(
          s: "rentabilidade da carteira",
        ),
        CardRentabilidadeCarteira(
          rMes: carteira.rentabilidadeCMes,
          rAno: carteira.rentabilidadeCAno,
          r12M: carteira.rentabilidadeC12M,
        ),
        TitleComponentText(
          s: "rentabilidade por categoria",
        ),
        CarrosselProdutosWidget(produtos: carteira.produtosCarteira),
        TitleComponentText(
          s: "gráfico de rentabilidade da carteira",
        ),
        GraficoRentabilidadeCarteiraCard(carteira.detalhesGraficoLinhas)
      ],
    );
  }
}
