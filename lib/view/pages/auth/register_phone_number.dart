import 'package:flutter/material.dart';
import 'package:mamaboo_v3/view/widgets/app_button.dart';
import 'package:mamaboo_v3/view/widgets/app_input_phone_number.dart';
import 'package:mamaboo_v3/view/widgets/app_spacing.dart';
import 'package:mamaboo_v3/view/widgets/app_text.dart';
import 'package:mamaboo_v3/view/widgets/auth_page_layout.dart';

class RegisterPhoneNumber extends StatefulWidget {
  const RegisterPhoneNumber({super.key});

  @override
  State<RegisterPhoneNumber> createState() => _RegisterPhoneNumberState();
}

class _RegisterPhoneNumberState extends State<RegisterPhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return AuthPageLayout(
      title: "Telefone",
      description:
          "Após preencher seu telefone abaixo, enviaremos um SMS para confirmar seu número.",
      child: Column(
        children: [
          const AppVerticalSpacing(values: 30),
          const AppInputPhoneNumber(),
          const AppVerticalSpacing(values: 20),
          const AppText(
            text:
                "O recebimento do SMS pode falhar ou demorar em função do sinal da rede móvel. Lembre-se também de checar a caixa de mensagens de seu dispositivo.",
          ),
          const AppVerticalSpacing(values: 20),
          AppButton(
            onPressed: () {},
            text: "Continuar",
            type: TypeButton.secondary,
            icon: Icons.arrow_forward,
          )
        ],
      ),
    );
  }
}
