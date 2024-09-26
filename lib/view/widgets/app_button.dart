import 'package:flutter/material.dart';
import 'package:mamaboo_v3/resources/app_colors.dart';
import 'package:mamaboo_v3/view/widgets/app_text.dart';

enum TypeButton {
  primary,
  secondary,
  translucent,
}

Color getButtonStyle(TypeButton type) {
  switch (type) {
    case TypeButton.primary:
      return primary600;
    case TypeButton.secondary:
      return secondary600;
    case TypeButton.translucent:
      return Colors.transparent;
    default:
      return primary600;
  }
}

class AppButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final bool? isborder;
  final IconData? icon;
  final TypeButton type;

  const AppButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.type = TypeButton.primary,
    this.isborder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 52,
      child: MaterialButton(
        onPressed: onPressed,
        elevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        hoverElevation: 0,
        color: getButtonStyle(type),
        shape: ContinuousRectangleBorder(
            side: BorderSide(
                color: isborder != null ? Colors.white : Colors.transparent,
                width: 2),
            borderRadius: BorderRadius.circular(18)),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: icon != null ? 10 : 0,
          children: [
            AppText(text: text, style: AppTextStyle.p_semi_bord),
            if (icon != null) ...[
              Icon(
                icon,
                color: Colors.white,
                size: 20,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
