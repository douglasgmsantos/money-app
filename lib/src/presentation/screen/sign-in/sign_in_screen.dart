// ignore_for_file: use_build_context_synchronously

import 'package:money/src/core/errors/failure.dart';
import 'package:money/src/domain/useCases/authentication_use_case.dart';
import 'package:money/src/presentation/controller/auth_controller.dart';
import 'package:money/src/presentation/widget/custom_text_form_field.dart';
import 'package:money/src/presentation/widget/button/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:money/src/presentation/widget/button/button_secondary.dart';
import 'package:money/src/presentation/screen/sign-up/sign_up_screen.dart';
import 'package:money/src/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _authController = AuthController();
  final _authenticateUserUseCase = AuthenticateUserUseCase();

  bool isLoading = false;

  Future<void> authenticate(String email, String password) async {
    try {
      setState(() {
        isLoading = true;
      });
      AuthState userState = Provider.of<AuthState>(context, listen: false);
      var response =
          await _authenticateUserUseCase.authenticate(email, password);

      if (response.$2 != null) {
        throw Failure(response.$2!);
      }

      if (response.$1 != null) {
        userState.setUser(response.$1!);
        Navigator.of(context).pushNamed('/home');
      }
    } on Failure catch (error) {
      QuickAlert.show(
        context: context,
        title: 'Oops...',
        type: QuickAlertType.error,
        text: error.message,
        confirmBtnText: "OK",
        confirmBtnColor: Theme.of(context).primaryColor,
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
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
          Padding(
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
                          height: 100,
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          height: 40,
                        ),
                        CustomTextFormField(
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "O campo e-mail é obrigatório.";
                            }

                            return null;
                          },
                          labelText: 'Digite seu e-mail.',
                          onChanged: _authController.setEmail,
                        ),
                        Container(
                          height: 5,
                        ),
                        CustomTextFormField(
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "O campo senha é obrigatório.";
                            }
                            return null;
                          },
                          labelText: 'Digite sua senha.',
                          isPassword: true,
                          onChanged: _authController.setPassword,
                        ),
                        Container(
                          height: 5,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {},
                            child: Text("Esqueceu a senha?",
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ButtonPrimary(
                          isLoading: isLoading,
                          text: "Entrar",
                          icon: Icons.arrow_forward_ios,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              await authenticate(_authController.email!,
                                  _authController.password!);
                            }
                          }),
                    ),
                    ButtonSecondary(
                        text: "Criar usuário",
                        icon: Icons.arrow_forward_ios,
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUp()),
                          );
                        })
                  ],
                )),
          )
        ],
      ),
    );
  }
}
