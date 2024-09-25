import 'package:flutter/material.dart';

// Enum de estilos de texto
enum AppTextStyle {
  p,
  p_semi_bord,
  p_no_bord,
  p_bold,
  h1,
  h1_semi_bord,
  h1_no_bord,
  h1_bold,
  h2,
  h2_semi_bord,
  h2_no_bord,
  h2_bold,
  h3,
  h3_semi_bord,
  h3_no_bord,
  h3_bold,
  h4,
  h4_semi_bord,
  h4_no_bord,
  h4_bold,
  small,
  small_semi_bord,
  small_no_bord,
  small_bold,
}

// Função que mapeia o enum para TextStyle
TextStyle getTextStyle(AppTextStyle style) {
  switch (style) {
    case AppTextStyle.p:
      return const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.white,
          height: 0); // Ajustando o espaçamento entre linhas
    case AppTextStyle.p_semi_bord:
      return const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          height: 0);
    case AppTextStyle.p_no_bord:
      return const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          height: 0);
    case AppTextStyle.p_bold:
      return const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          height: 0);
    case AppTextStyle.h1:
      return const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.normal,
          color: Colors.white,
          height: 0);
    case AppTextStyle.h1_semi_bord:
      return const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          height: 0);
    case AppTextStyle.h1_no_bord:
      return const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          height: 0);
    case AppTextStyle.h1_bold:
      return const TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          height: 0);
    case AppTextStyle.h2:
      return const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.normal,
          color: Colors.white,
          height: 0);
    case AppTextStyle.h2_semi_bord:
      return const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          height: 0);
    case AppTextStyle.h2_no_bord:
      return const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          height: 0);
    case AppTextStyle.h2_bold:
      return const TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          height: 0);
    case AppTextStyle.h3:
      return const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.normal,
          color: Colors.white,
          height: 0);
    case AppTextStyle.h3_semi_bord:
      return const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          height: 0);
    case AppTextStyle.h3_no_bord:
      return const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          height: 0);
    case AppTextStyle.h3_bold:
      return const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          height: 0);
    case AppTextStyle.h4:
      return const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: Colors.white,
          height: 0);
    case AppTextStyle.h4_semi_bord:
      return const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          height: 0);
    case AppTextStyle.h4_no_bord:
      return const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          height: 0);
    case AppTextStyle.h4_bold:
      return const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          height: 0);

    case AppTextStyle.small:
      return const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.white,
          height: 0);

    case AppTextStyle.small_semi_bord:
      return const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          height: 0);
    case AppTextStyle.small_no_bord:
      return const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          height: 0);
    case AppTextStyle.small_bold:
      return const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          height: 0);
      ;
    default:
      return const TextStyle(fontSize: 14, color: Colors.white, height: 0);
  }
}

// Widget AppText que recebe uma string e um estilo do enum
class AppText extends StatelessWidget {
  final String text;
  final AppTextStyle style;

  // Definindo um valor padrão para o estilo
  const AppText({
    Key? key,
    required this.text,
    this.style = AppTextStyle.p, // Estilo padrão: parágrafo (p)
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getTextStyle(style),
    );
  }
}
