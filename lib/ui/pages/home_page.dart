import 'package:flutter/material.dart';
import 'package:genial_test/ui/pages/minha_carteira/tabs_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste Genial Investimentos'),
      ),
      body: Center(
        child: FlatButton(
            onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TabsPage(),
                  ),
                ),
            child: Text("Clique para iniciar!")),
      ),
    );
  }
}
