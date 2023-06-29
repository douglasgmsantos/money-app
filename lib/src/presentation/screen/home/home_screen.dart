import 'package:flutter/material.dart';
import 'package:money/src/presentation/widget/money-container/money-container.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const MoneyContainer(
      title: "Money",
      body: Center(
        child: Text('Conteúdo da tela'),
      ),
    );
  }
}
