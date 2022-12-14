import 'package:bloc_zero_to_hero/vandad_nahavandipoor/login/strings.dart'
    show enterYourEmailHere;
import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController emailController;

  const EmailTextField({
    super.key,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      autocorrect: false,
      decoration: const InputDecoration(
        hintText: enterYourEmailHere,
      ),
    );
  }
}
