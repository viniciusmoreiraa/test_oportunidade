import 'package:flutter/material.dart';
import 'package:genial_test/blocs/theme_bloc.dart';
import 'package:genial_test/ui/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeBloc(),
      child: Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeBloc bloc = Provider.of<ThemeBloc>(context);

    return MaterialApp(
      title: "Teste Genial Investimentos",
      debugShowCheckedModeBanner: false,
      theme: bloc.theme,
      home: HomePage(),
    );
  }
}
