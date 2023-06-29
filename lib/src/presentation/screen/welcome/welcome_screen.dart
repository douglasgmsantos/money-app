import 'package:money/src/presentation/widget/button/button_primary.dart';
import 'package:money/src/presentation/widget/button/button_secondary.dart';
import 'package:money/src/presentation/screen/sign-in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:money/src/presentation/screen/sign-up/sign_up_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Container(
            padding: const EdgeInsets.all(40),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/shape_welcome.png"),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/logo-white.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: const SizedBox(
                                width: 190,
                                child: Text(
                                  'Bem vindo ao Money',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      decoration: TextDecoration.none),
                                ),
                              ),
                            ),
                          )
                        ],
                      )),
                  Column(
                    children: [
                      ButtonPrimary(
                          text: "Entrar",
                          icon: Icons.arrow_forward_ios,
                          onPressed: () {
                            Navigator.of(context).pushNamed('/signin');
                          }),
                      Container(
                        height: 30,
                      ),
                      ButtonSecondary(
                          text: "Criar usuário",
                          icon: Icons.arrow_forward_ios,
                          onPressed: () {
                            Navigator.of(context).pushNamed('/signup');
                          })
                    ],
                  )
                ],
              ),
            )));
  }
}
