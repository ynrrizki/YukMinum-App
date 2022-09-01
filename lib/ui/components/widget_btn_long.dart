import 'package:flutter/material.dart';
import 'package:yukminum_app/shared/themes/themes.dart';

class BtnLong extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final double scale;
  final Color? color;
  const BtnLong(
      {Key? key,
      required this.title,
      required this.onPressed,
      this.scale = 4,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: color ?? Color(0xff121212),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7.92),
          )),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: MediaQuery.of(context).size.width / scale),
        child: Text(title, style: interBtnLong, textAlign: TextAlign.center),
      ),
    );
  }
}
