import 'package:flutter/material.dart';
import 'package:money/src/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AuthState>(context);

    return Text("${appState.user?.email}");
  }
}
