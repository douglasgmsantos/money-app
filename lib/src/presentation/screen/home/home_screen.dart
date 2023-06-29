import 'package:flutter/material.dart';
import 'package:money/src/domain/useCases/authentication_use_case.dart';
import 'package:money/src/presentation/widget/button/button_secondary.dart';
import 'package:money/src/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _authenticateUserUseCase = AuthenticateUserUseCase();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AuthState>(context);

    return Container(
        child: ButtonSecondary(
            text: "Logout",
            icon: Icons.arrow_forward_ios,
            onPressed: () async {
              _authenticateUserUseCase.logout();
            }));
  }
}
