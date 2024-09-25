import 'package:flutter/material.dart';
import 'package:mamaboo_v3/view/widgets/app_text.dart';

class AppImageButton extends StatelessWidget {
  final double? width;
  final double? heiht;
  final void Function() onPressed;
  final String image;
  final String? text;
  const AppImageButton({
    super.key,
    this.width,
    this.heiht,
    required this.onPressed,
    required this.image,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 150,
      height: heiht ?? 52,
      child: MaterialButton(
        onPressed: onPressed,
        elevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        hoverElevation: 0,
        color: Colors.white,
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: text != null ? 10 : 0,
          children: [
            Image.asset(
              image,
              width: 20,
              height: 20,
            ),
            if (text != null && text != "")
              Text(text!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  )),
          ],
        ),
      ),
    );
  }
}
