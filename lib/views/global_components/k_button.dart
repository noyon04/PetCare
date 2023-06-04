import 'package:flutter/material.dart';
import 'package:dog/views/styles/b_style.dart';

class KButton extends StatelessWidget {
  const KButton({
    Key? key,
    this.text,
    this.txtcolor,
    this.containerColor,
    this.borderColor,
    this.kbuttonTap,
    this.getHeight,
    this.getWidth,
    this.isPrefixIcon = false,
    this.prefixIcon,
  }) : super(key: key);
  final Widget? text;
  final Color? txtcolor;
  final Color? containerColor;
  final Color? borderColor;
  final GestureTapCallback? kbuttonTap;
  final double? getWidth;
  final double? getHeight;
  final bool isPrefixIcon;
  final Icon? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: kbuttonTap,
      child: Container(
        alignment: Alignment.center,
        width: getWidth,
        height: getHeight,
        decoration: BoxDecoration(
            border: Border.all(
              width: 0.7,
              color: borderColor!,
            ),
            borderRadius: BorderRadius.circular(35),
            color: containerColor),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          //
          if (isPrefixIcon)
            Padding(
              padding: EdgeInsets.only(right: 5),
              child: prefixIcon,
              
            ),
          //
          text!,
        ]),
      ),
    );
  }
}
