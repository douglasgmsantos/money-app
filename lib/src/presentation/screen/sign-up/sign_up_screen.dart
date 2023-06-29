import 'dart:async';

import 'package:money/src/domain/useCases/authentication_use_case.dart';
import 'package:money/src/presentation/widget/button/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:money/src/presentation/widget/button/button_secondary.dart';
import 'package:money/src/presentation/controller/create_user_controller.dart';
import 'package:money/src/presentation/widget/custom_text_form_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final createUserController = CreateUserController();
  final _authenticateUserUseCase = AuthenticateUserUseCase();

  bool isLoading = false;
  bool isVisible = false;

  Future<void> createWithEmailAndPassword(
      String name, String email, String password) async {
    var createdUser = false;

    try {
      createdUser =
          await _authenticateUserUseCase.createUser(name, email, password);

      setState(() {
        isLoading = false;
      });

      Navigator.of(context).pushNamed('/signin');
    } catch (error) {
      print(error);
    }
  }

  onSubmitted(String name, String email, String password) {
    setState(() {
      isLoading = true;
    });

    createWithEmailAndPassword(name, email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: 360,
            height: 313,
            child: Image.asset(
              'assets/images/shape_sign_or_signup.png',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 40),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
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
                          Container(
                            height: 60,
                          ),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Cadastra-se",
                              style: TextStyle(
                                  fontSize: 28, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            height: 5,
                          ),
                          CustomTextFormField(
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, insira nome';
                              }

                              return null;
                            },
                            labelText: 'Digite seu nome',
                            onChanged: createUserController.setName,
                          ),
                          Container(
                            height: 5,
                          ),
                          CustomTextFormField(
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, insira um endereço de e-mail';
                              }

                              final emailRegex = RegExp(
                                  r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$');
                              if (!emailRegex.hasMatch(value)) {
                                return 'Por favor, insira um endereço de e-mail válido';
                              }

                              return null;
                            },
                            labelText: 'Digite seu e-mail',
                            onChanged: createUserController.setEmail,
                          ),
                          Container(
                            height: 5,
                          ),
                          CustomTextFormField(
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, insira uma senha.';
                              }

                              if (value.length < 5) {
                                return 'Sua senha deve ter mais que 5 caracteres.';
                              }

                              return null;
                            },
                            labelText: 'Digite sua senha',
                            isPassword: true,
                            onChanged: createUserController.setPassword,
                          ),
                          Container(
                            height: 5,
                          ),
                          CustomTextFormField(
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, confirme sua senha.';
                              }

                              if (value != createUserController.password) {
                                return 'Suas senhas estão diferentes.';
                              }

                              return null;
                            },
                            labelText: 'Confirme sua senha',
                            onChanged: createUserController.setConfirmPassword,
                            isPassword: true,
                          ),
                        ],
                      ),
                      Container(
                        height: 10,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: ButtonPrimary(
                              isLoading: isLoading,
                              text: "Cadastrar",
                              icon: Icons.arrow_forward_ios,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  onSubmitted(
                                      createUserController.name!,
                                      createUserController.email!,
                                      createUserController.password!);
                                }
                              })),
                      Container(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ButtonSecondary(
                            text: "Voltar",
                            icon: Icons.arrow_forward_ios,
                            onPressed: () async {
                              Navigator.of(context).pushNamed('/welcome');
                            }),
                      )
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
