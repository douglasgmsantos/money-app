import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:money/src/presentation/screen/home/chart_balance.dart';
import 'package:money/src/presentation/screen/home/list_transactions.dart';
import 'package:money/src/presentation/widget/money-container/money-container.dart';
import 'package:money/src/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  bool _isElementVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_handleScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      setState(() {
        _isElementVisible = false;
      });
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      setState(() {
        _isElementVisible = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AuthState>(context);
    final profileName = appState.user!.getFirstName();

    return MoneyContainer(
        title: "Money",
        body: Column(children: [
          _isElementVisible
              ? Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.vertical(
                        top: Radius.zero, bottom: Radius.circular(30)),
                  ),
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Seja bem-vindo(a), $profileName',
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                )
              : Container(),
          const SizedBox(height: 1),
          Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(80))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.white,
                      child: SingleChildScrollView(
                          controller: _scrollController,
                          child: const Column(
                            children: [
                              ChartBalance(),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Transações Recentes",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                              ListTransactions()
                            ],
                          )),
                    ),
                  ))),
        ]));
  }
}
