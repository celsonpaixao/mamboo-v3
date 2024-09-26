import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mamaboo_v3/app/app_module.dart';
import 'package:mamaboo_v3/resources/app_colors.dart';
import 'package:mamaboo_v3/resources/app_routers.dart';
import 'package:mamaboo_v3/view/widgets/app_button.dart';
import 'package:mamaboo_v3/view/widgets/app_image_button.dart';
import 'package:mamaboo_v3/view/widgets/app_input.dart';
import 'package:mamaboo_v3/view/widgets/app_text.dart';
import 'package:mamaboo_v3/view/widgets/app_spacing.dart';
import 'package:mamaboo_v3/view/widgets/auth_page_layout.dart';
import 'package:mamaboo_v3/viewmodel/login_view_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var isVisible = true;
  var keepMeConnected = false;
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final LoginViewModel viewmodel = LoginViewModel();
  @override
  Widget build(BuildContext context) {
    return AuthPageLayout(
        title: "Login",
        description:
            "Faça o login e desfrute dos serviços que a Mamboo oferece para si.",
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildForm(),
            const AppVerticalSpacing(
              values: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSwitcher(),
                GestureDetector(
                  child: const AppText(
                    text: "Esqueceu a senha?",
                    style: AppTextStyle.small,
                  ),
                )
              ],
            ),
            const AppVerticalSpacing(
              values: 20,
            ),
            AppButton(
              type: TypeButton.secondary,
              onPressed: () => viewmodel.clickLogin(
                context: context,
                formKey: _formKey,
              ), // Use uma função anônima para chamar clickLogin
              text: "Fazer login",
              icon: Icons.arrow_forward,
            ),
            const AppVerticalSpacing(
              values: 20,
            ),
            _buildDivider(),
            const AppVerticalSpacing(
              values: 20,
            ),
            _buildHeader()
          ],
        ));
  }

  Column _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppImageButton(
              onPressed: () {},
              text: " Google",
              image: "assets/google_image_upscayl_2x_realesrgan-x4plus.png",
            ),
            AppImageButton(
              onPressed: () {},
              text: " Apple",
              image: "assets/apple_image_upscayl_2x_realesrgan-x4plus.png",
            ),
          ],
        ),
        const AppVerticalSpacing(
          values: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppText(text: "Não tem uma conta?"),
            const AppHorizontalSpacing(
              values: 5,
            ),
            GestureDetector(
              onTap: () => modularSimpleNavigation(router: registerPage),
              child: const AppText(
                text: "Registar",
                style: AppTextStyle.p_bold,
              ),
            )
          ],
        ),
      ],
    );
  }

  Row _buildDivider() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            color: Colors.white,
          ),
        ),
        AppHorizontalSpacing(),
        AppText(text: "or use one of these options"),
        AppHorizontalSpacing(),
        Expanded(
          child: Divider(
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Row _buildSwitcher() {
    return Row(
      children: [
        Transform.scale(
          scale: 0.9,
          child: Switch(
            value: keepMeConnected,
            inactiveTrackColor: Colors.transparent,
            activeColor: secondary500,
            inactiveThumbColor: Colors.white,
            trackOutlineColor: const MaterialStatePropertyAll(Colors.white),
            trackOutlineWidth: const MaterialStatePropertyAll(1),
            onChanged: (value) {
              setState(() {
                keepMeConnected = value;
              });
            },
          ),
        ),
        const AppHorizontalSpacing(
          values: 5,
        ),
        const AppText(
          text: "Manter-me ligado",
          style: AppTextStyle.small_no_bord,
        ),
      ],
    );
  }

  Form _buildForm() {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            const AppVerticalSpacing(
              values: 20,
            ),
            AppInput(
              label: "E-mail",
              type: TextInputType.emailAddress,
              controller: emailController,
              hintText: "Digite seu E-mail",
              prefixIcon: const Icon(Icons.person_outline_rounded),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Por favor, digite seu e-mail";
                }
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                  return "";
                }
                return null;
              },
            ),
            const AppVerticalSpacing(
              values: 20,
            ),
            AppInput(
              label: "Senha",
              controller: passwordController,
              type: TextInputType.text,
              hintText: "Digite sua senha",
              obscureText: isVisible,
              maxLines: 1,
              sufixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: Icon(
                  isVisible ? Icons.visibility_off : Icons.visibility,
                ),
              ),
              prefixIcon: const Icon(Icons.lock_outline),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Por favor, digite sua senha";
                }
                if (value.length < 6) {
                  return "A senha deve ter pelo menos 6 caracteres";
                }
                return null;
              },
            ),
          ],
        ));
  }
}
