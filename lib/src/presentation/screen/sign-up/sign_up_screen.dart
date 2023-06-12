import 'dart:async';

import 'package:money/src/presentation/widget/button/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:money/src/presentation/widget/button/button_secondary.dart';
import 'package:money/src/presentation/controller/sign_up.dart';
import 'package:money/src/utils/validations/validate_email.dart';
import 'package:money/src/utils/validations/validate_password.dart';
import 'package:money/src/model/enum/status_validation_enum.dart';
import 'package:money/src/presentation/screen/sign-in/sign_in_screen.dart';
import 'package:money/src/presentation/screen/welcome/welcome_screen.dart';

import '../../../services/authentication_service.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final AuthenticationService _authenticationService = AuthenticationService();

  SignUpController controller = SignUpController();
  StatusValidationDefault statusEmail = StatusValidationDefault.PRISTINE;
  StatusValidationDefault statusSenha = StatusValidationDefault.PRISTINE;
  StatusValidationDefault statusConfirmSenha = StatusValidationDefault.PRISTINE;

  bool isLoading = false;
  bool isVisible = false;

  String email = "";
  String password = "";
  String confirmPassword = "";

  @override
  void initState() {
    super.initState();
    controller.email.addListener(_getErrorTextEmail);
    controller.password.addListener(_getErrorTextPassword);
    controller.confirmPassword.addListener(_getErrorTextConfirmPassword);
  }

  @override
  void dispose() {
    controller.email.dispose();
    controller.password.dispose();
    controller.confirmPassword.dispose();
    super.dispose();
  }

  String? _getErrorTextEmail() {
    String email = controller.email.text.trim();

    if (email.length < 3 && email.isEmpty) return null;

    if (!ValidadteEmail().validate(email)) {
      statusEmail = StatusValidationDefault.ERROR;
      return "E-mail inválido.";
    }

    statusEmail = StatusValidationDefault.SUCCESS;
    return null;
  }

  String? _getErrorTextPassword() {
    ValidatePassword validadePassword = ValidatePassword();
    String password = controller.password.text.trim();
    String confirmPassword = controller.confirmPassword.text.trim();

    if (password.length < 3 && password.isEmpty) return null;

    if (!validadePassword.isPasswordLengthValid(password, confirmPassword)) {
      statusConfirmSenha = StatusValidationDefault.ERROR;
      return "Sua senha deve ter mais que 5 caracteres.";
    }

    statusConfirmSenha = StatusValidationDefault.SUCCESS;
    return null;
  }

  String? _getErrorTextConfirmPassword() {
    ValidatePassword validadePassword = ValidatePassword();
    String password = controller.password.text.trim();
    String confirmPassword = controller.confirmPassword.text.trim();

    if (confirmPassword.length < 3 && confirmPassword.isEmpty) return null;

    if (!validadePassword.isPasswordEquals(password, confirmPassword)) {
      statusConfirmSenha = StatusValidationDefault.ERROR;
      return "As senhas são diferentes.";
    }

    statusConfirmSenha = StatusValidationDefault.SUCCESS;
    return null;
  }

  bool _getStatusEmail() {
    return [StatusValidationDefault.SUCCESS, StatusValidationDefault.PRISTINE]
        .contains(statusEmail);
  }

  bool _getStatusPassword() {
    return [StatusValidationDefault.SUCCESS, StatusValidationDefault.PRISTINE]
        .contains(statusSenha);
  }

  bool _getStatusConfirmPassword() {
    return [StatusValidationDefault.SUCCESS, StatusValidationDefault.PRISTINE]
        .contains(statusConfirmSenha);
  }

  Future<void> createWithEmailAndPassword(String email, String password) async {
    var user = await _authenticationService.createWithEmailAndPassword(
        email, password);

    setState(() {
      isLoading = false;
    });

    if (user != null) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const SignIn()),
      );
    }
  }

  onSubmitted(String email, String password) {
    setState(() {
      isLoading = true;
    });

    createWithEmailAndPassword(email, password);
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
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Digite seu e-mail',
                          errorText: _getErrorTextEmail(),
                          suffixIcon: _getStatusEmail()
                              ? null
                              : const Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                )),
                      controller: controller.email,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    Container(
                      height: 5,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Digite sua senha',
                          errorText: _getErrorTextPassword(),
                          suffixIcon: _getStatusPassword()
                              ? null
                              : const Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                )),
                      obscureText: !isVisible,
                      controller: controller.password,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    Container(
                      height: 5,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Confirme sua senha',
                          errorText: _getErrorTextConfirmPassword(),
                          suffixIcon: _getStatusConfirmPassword()
                              ? null
                              : const Icon(
                                  Icons.error_outline,
                                  color: Colors.red,
                                )),
                      obscureText: !isVisible,
                      controller: controller.confirmPassword,
                      onChanged: (value) {
                        setState(() {
                          confirmPassword = value;
                        });

                        _getStatusConfirmPassword();
                      },
                    ),
                  ],
                ),
                SizedBox(
                    width: double.infinity,
                    child: ButtonPrimary(
                        isLoading: isLoading,
                        text: "Cadastrar",
                        icon: Icons.arrow_forward_ios,
                        onPressed: () {
                          onSubmitted(email, password);
                        })),
                SizedBox(
                  width: double.infinity,
                  child: ButtonSecondary(
                      text: "Voltar",
                      icon: Icons.arrow_forward_ios,
                      onPressed: () async {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WelcomeScreen()),
                        );
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
