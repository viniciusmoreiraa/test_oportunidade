import 'package:flutter/material.dart';
import 'package:genial_test/blocs/carteira_bloc.dart';
import 'package:genial_test/blocs/exibir_valores_bloc.dart';
import 'package:genial_test/ui/pages/minha_carteira/carteira_tab.dart';
import 'package:genial_test/ui/pages/minha_carteira/movimentacoes_tab.dart';
import 'package:genial_test/ui/pages/minha_carteira/posicao_tab.dart';

import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CarteiraBloc>.value(
          value: CarteiraBloc(),
        ),
        ChangeNotifierProvider<ExibirValoresBloc>.value(
          value: ExibirValoresBloc(),
        ),
      ],
      child: _build(context),
    );
  }

  Widget _build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Minha carteira'),
          bottom: TabBar(
            isScrollable: true,
            labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
            // isScrollable: true,
            tabs: listTabs(context),
          ),
        ),
        body: TabBarView(children: [
          CarteiraTabView(),
          MovimentacoesTabView(),
          PosicaoTabView(),
        ]),
      ),
    );
  }

  List<Widget> listTabs(BuildContext context) {
    final list = [
      "CARTEIRA",
      "MOVIMENTAÇÕES",
      "POSIÇÃO",
    ];
    List<Widget> listWidgets = [];

    list.forEach(
      (element) {
        listWidgets.add(
          Tab(
            text: element,
          ),
        );
      },
    );
    return listWidgets;
  }
}
