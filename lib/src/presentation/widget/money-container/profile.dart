import 'package:flutter/material.dart';
import 'package:money/src/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AuthState>(context);
    final profileName = appState.user!.getFirstNameAndLastName();

    return Row(
      children: [
        const SizedBox(
          height: 50,
          width: 50,
          child: CircleAvatar(
            radius: 50, // Define o tamanho do círculo
            backgroundImage: AssetImage(
                'assets/images/sticker_profile_man.png'), // Define a imagem a ser exibida
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text(
            profileName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        )
      ],
    );
  }
}
