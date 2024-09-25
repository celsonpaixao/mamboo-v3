import 'package:flutter/material.dart';
import 'package:mamaboo_v3/resources/app_colors.dart';
import 'package:mamaboo_v3/view/widgets/app_text.dart';

class LoginViewModel {
  void clickLogin({
    required GlobalKey<FormState> formKey,
    required BuildContext context,
  }) {
    if (formKey.currentState!.validate()) {
      // Mostra um SnackBar de sucesso
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Formulário válido! Prosseguindo com login..."),
          backgroundColor: green500,
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      // Mostra um SnackBar de erro
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.info_outline,
                color: Colors.white,
              ),
              AppText(text: "Formulário inválido! Verifique os campos.")
            ],
          ),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
