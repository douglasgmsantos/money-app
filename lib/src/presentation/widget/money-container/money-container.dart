import 'package:flutter/material.dart';
import 'package:money/src/domain/useCases/authentication_use_case.dart';
import 'package:money/src/presentation/widget/money-container/drawer-item.dart';
import 'package:money/src/presentation/widget/money-container/profile.dart';
import 'package:money/src/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class MoneyContainer extends StatefulWidget {
  final String title;
  final Widget body;

  const MoneyContainer({super.key, required this.title, required this.body});

  @override
  State<MoneyContainer> createState() => _MoneyContainerState();
}

class _MoneyContainerState extends State<MoneyContainer> {
  final _authenticateUserUseCase = AuthenticateUserUseCase();

  logout() {
    AuthState userState = Provider.of<AuthState>(context, listen: false);
    _authenticateUserUseCase.logout();
    userState.logout();
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushNamed('/signin');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        backgroundColor: const Color(0xFF2743FB),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF2743FB),
              ),
              child: Profile(),
            ),
            DrawerItem(
              leading: const Icon(
                Icons.payment,
              ),
              title: "Transações",
              onTap: () {
                // Ação quando a opção 1 for selecionada
              },
            ),
            const Divider(),
            DrawerItem(
              showTrailing: false,
              leading: const Icon(
                Icons.logout,
              ),
              title: "Logout",
              onTap: logout,
            )
          ],
        ),
      ),
      body: widget.body,
    );
  }
}
