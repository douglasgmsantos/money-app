import 'package:flutter/material.dart';

class ListTransactions extends StatefulWidget {
  const ListTransactions({super.key});

  @override
  State<ListTransactions> createState() => _ListTransactionsState();
}

class _ListTransactionsState extends State<ListTransactions> {
  @override
  Widget build(BuildContext context) {
    final List<String> items =
        List<String>.generate(100, (index) => 'Item $index');

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: items.map((item) => ListTile(title: Text(item))).toList(),
      ),
    );
  }
}
