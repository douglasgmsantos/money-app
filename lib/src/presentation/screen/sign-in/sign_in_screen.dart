import 'dart:async';

import 'package:money/src/presentation/widget/button/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:money/src/presentation/widget/button/button_secondary.dart';
import 'package:money/src/presentation/controller/sign_in.dart';
import 'package:money/src/providers/auth_provider.dart';
import 'package:money/src/presentation/screen/profile/profile_screen.dart';
import 'package:money/src/utils/validations/database/firebase/firestore.dart';
import 'package:money/src/utils/validations/validate_email.dart';
import 'package:money/src/model/enum/status_validation_enum.dart';
import 'package:money/src/presentation/screen/home/home_screen.dart';
import 'package:money/src/presentation/screen/sign-up/sign_up_screen.dart';
import 'package:provider/provider.dart';

import '../../../services/authentication_service.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  final AuthenticationService _authenticationService = AuthenticationService();

  DatabseFirebaseFirestore firebaseFirestore = DatabseFirebaseFirestore();
  SignInController controller = SignInController();
  StatusValidationDefault statusEmail = StatusValidationDefault.PRISTINE;

  bool isLoading = false;
  bool isVisible = false;

  String email = "";
  String password = "";

  @override
  void initState() {
    super.initState();
    controller.email.addListener(validateEmail);
  }

  @override
  void dispose() {
    controller.email.dispose();
    super.dispose();
  }

  void validateEmail() {
    String email = controller.email.text.trim();
    bool isValid = ValidadteEmail().validate(email);

    if (email.length > 3) {
      setState(() {
        statusEmail = isValid
            ? StatusValidationDefault.SUCCESS
            : StatusValidationDefault.ERROR;
      });
    }
  }

  bool _getStatusEmail() {
    return [StatusValidationDefault.SUCCESS, StatusValidationDefault.PRISTINE]
        .contains(statusEmail);
  }

  Future<void> signWithEmailAndPassword(String email, String password) async {
    AuthState userState = Provider.of<AuthState>(context, listen: false);

    var user =
        await _authenticationService.signWithEmailAndPassword(email, password);

    setState(() {
      isLoading = false;
    });

    if (user != null) {
      userState.setUser(user.user!);
      Widget redirectScreen = Profile();

      if (user.user?.displayName != null &&
          user.user!.displayName!.isNotEmpty &&
          user.user?.photoURL != null &&
          user.user!.photoURL!.isNotEmpty &&
          user.user?.phoneNumber != null &&
          user.user!.phoneNumber!.isNotEmpty) {
        redirectScreen = const Home();
      }
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => redirectScreen),
      );
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
                    TextField(
                      decoration: InputDecoration(
                          errorText:
                              _getStatusEmail() ? null : 'Email inválido',
                          labelText: 'Digite seu e-mail',
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

                        validateEmail();
                      },
                    ),
                    Container(
                      height: 5,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          labelText: 'Digite sua senha',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            child: Icon(!isVisible
                                ? Icons.remove_red_eye_rounded
                                : Icons.remove_red_eye_outlined),
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
                        setState(() {
                          isLoading = true;
                        });

                        signWithEmailAndPassword(email, password);
                      }),
                ),
                ButtonSecondary(
                    text: "Criar usuário",
                    icon: Icons.arrow_forward_ios,
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUp()),
                      );
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
