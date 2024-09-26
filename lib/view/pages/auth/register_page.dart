import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mamaboo_v3/app/app_module.dart';
import 'package:mamaboo_v3/resources/app_routers.dart';
import 'package:mamaboo_v3/view/widgets/app_button.dart';
import 'package:mamaboo_v3/view/widgets/app_input.dart';
import 'package:mamaboo_v3/view/widgets/app_spacing.dart';
import 'package:mamaboo_v3/view/widgets/app_text.dart';
import 'package:mamaboo_v3/view/widgets/auth_page_layout.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return AuthPageLayout(
      title: "Cadastrar",
      description: "Faça o seu cadastro, será rapido e simples.",
      child: Column(
        children: [
          _buildForm(),
          const AppVerticalSpacing(
            values: 25,
          ),
          AppButton(
            onPressed: () =>
                modularSimpleNavigation(router: registerPhoneNumberPage),
            text: "Seguinte",
            type: TypeButton.secondary,
            icon: Icons.arrow_forward_rounded,
          ),
          AppVerticalSpacing(
            values: MediaQuery.of(context).size.height / 8,
          ),
          _buildFooter(),
        ],
      ),
    );
  }

  Row _buildFooter() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AppText(text: "Já tem uma conta?"),
        const AppHorizontalSpacing(
          values: 5,
        ),
        GestureDetector(
          onTap: () => modularSimpleNavigation(router: loginPage),
          child: const AppText(
            text: "Logar",
            style: AppTextStyle.p_bold,
          ),
        ),
      ],
    );
  }

  Form _buildForm() => Form(
          child: Column(
        children: [
          const AppVerticalSpacing(
            values: 25,
          ),
          const AppInput(
            type: TextInputType.text,
            label: "E-mail",
            hintText: "Digite seu E-mail",
            prefixIcon: Icon(Icons.person_outline_rounded),
          ),
          const AppVerticalSpacing(
            values: 25,
          ),
          const AppInput(
            type: TextInputType.text,
            label: "Senha",
            hintText: "Digite sua senha",
            prefixIcon: Icon(Icons.lock_outline),
            sufixIcon: Icon(Icons.visibility_outlined),
          ),
          const AppVerticalSpacing(
            values: 25,
          ),
          const AppInput(
            type: TextInputType.text,
            label: "Confirme sua senha",
            hintText: "Digite sua senha novamente",
            prefixIcon: Icon(Icons.lock_outline),
            sufixIcon: Icon(Icons.visibility_outlined),
          ),
        ],
      ));
}
