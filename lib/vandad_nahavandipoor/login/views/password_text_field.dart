import 'package:bloc_zero_to_hero/vandad_nahavandipoor/login/strings.dart'
    show enterYourPasswordHere;
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController passwordController;

  const PasswordTextField({
    super.key,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: passwordController,
      obscureText: true,
      obscuringCharacter: '0',
      autocorrect: false,
      decoration: const InputDecoration(
        hintText: enterYourPasswordHere,
      ),
    );
  }
}
