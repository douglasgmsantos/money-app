import 'package:flutter/material.dart';
import 'package:money/src/presentation/widget/money-container/money-container.dart';
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
    final profileName = appState.user!.getFirstName();

    return MoneyContainer(
      title: "Money",
      body: Container(
        // color: Theme.of(context).primaryColor,
        height: 150,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: const BorderRadius.vertical(
              top: Radius.zero, bottom: Radius.circular(80)),
        ),
        child: SizedBox(
          width: double.maxFinite,
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Seja bem-vindo(a), $profileName',
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(80))),
                  child: Positioned(
                    top: 100,
                    left: 50,
                    width: 200,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        width: double.maxFinite,
                        height: 315,
                        color: Colors.red,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
