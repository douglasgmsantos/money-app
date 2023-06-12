import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:money/src/presentation/widget/button/button_secondary.dart';
import 'package:money/src/presentation/widget/button/button_select_avatar.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:money/src/presentation/controller/profile.dart';
import 'package:money/src/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AuthState>(context);
    final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
    ProfileController controller = ProfileController();

    XFile? photo;

    Future<void> updateProfile() async {
      var name = controller.name.text;
      var telefone = controller.telefone.text;
      print(photo);

      // appState.user?.updateDisplayName(name);
      // appState.user?.updatePhotoURL(telefone);
      // var user =
      //     await _authenticationService.

      // setState(() {
      //   isLoading = false;
      // });
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 79, 202, 233),
              const Color(0xFF40CEF2),
              Colors.blue,
              Theme.of(context).primaryColor,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
          child: SizedBox(
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.center,
                  child: ButtonSelectAvatar(),
                ),
                Container(height: 100),
                FormBuilder(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          FormBuilderTextField(
                            name: 'name',
                            controller: controller.name,
                            decoration:
                                const InputDecoration(labelText: 'Nome'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo obrigatório';
                              }
                              return null;
                            },
                          ),
                          FormBuilderTextField(
                            keyboardType: TextInputType.phone,
                            name: 'Telefone',
                            controller: controller.telefone,
                            decoration:
                                const InputDecoration(labelText: 'Telefone'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Campo obrigatório';
                              }
                              // Expressão regular para verificar se o telefone está no formato correto
                              RegExp regex =
                                  RegExp(r'^\(\d{2}\)\s\d{4,5}-\d{4}$');
                              if (!regex.hasMatch(value)) {
                                return 'Telefone inválido';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      Container(height: 100),
                      ButtonSecondary(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            updateProfile();
                          }
                        },
                        text: "Enviar",
                        icon: Icons.arrow_forward_ios,
                      ),
                    ],
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
