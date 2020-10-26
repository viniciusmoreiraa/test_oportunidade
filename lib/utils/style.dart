import 'dart:ui';

import 'package:flutter/material.dart';

styleH3({double size, Color color, BuildContext context}) {
  return TextStyle(
    color: color ?? Theme.of(context).textTheme.headline3.color,
    fontSize: size ?? Theme.of(context).textTheme.headline3.fontSize,
    fontWeight: Theme.of(context).textTheme.headline3.fontWeight,
    fontStyle: Theme.of(context).textTheme.headline3.fontStyle,
  );
}

styleH2({double size, Color color, BuildContext context}) {
  return TextStyle(
    color: color ?? Colors.black,
    fontSize: size ?? Theme.of(context).textTheme.headline2.fontSize,
    fontWeight: Theme.of(context).textTheme.headline2.fontWeight,
    fontStyle: Theme.of(context).textTheme.headline2.fontStyle,
  );
}

styleLinkButton({double size, Color color, BuildContext context}) {
  return TextStyle(
      color: color ?? Colors.black,
      fontSize: size ?? 14,
      fontWeight: FontWeight.w300,
      fontStyle: FontStyle.normal,
      decoration: TextDecoration.underline);
}

styleW300({double size, Color color, BuildContext context}) {
  return TextStyle(
    color: color ?? Colors.black,
    fontSize: size ?? 14,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
  );
}

styleW400({double size, Color color, BuildContext context}) {
  return TextStyle(
    color: color ?? Colors.black,
    fontSize: size ?? 14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );
}

styleW700({double size, Color color, BuildContext context}) {
  return TextStyle(
    color: color ?? Colors.white,
    fontSize: size ?? 12,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );
}

styleW600({double size, Color color, BuildContext context}) {
  return TextStyle(
    color: color ?? Colors.white,
    fontSize: size ?? 12,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.normal,
  );
}

styleDisplay({double size, Color color, BuildContext context}) {
  return TextStyle(
    color: color ?? Colors.black,
    fontSize: size ?? 28,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.normal,
  );
}

decorationCardShadowBlue() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(5)),
    boxShadow: [
      BoxShadow(
        color: Color(0xff364DCD).withOpacity(0.25),
        spreadRadius: 8,
        blurRadius: 8,
        offset: Offset(0, 8), // changes position of shadow
      ),
    ],
  );
}

decorationCircleShadowBlue() {
  return BoxDecoration(
    color: Colors.white,
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(
        color: Color(0xff364DCD).withOpacity(0.25),
        spreadRadius: 8,
        blurRadius: 8,
        offset: Offset(0, 8), // changes position of shadow
      ),
    ],
  );
}

decorationCircleInnerShadow(double sizeRadius) {
  return BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.transparent,
    boxShadow: [
      BoxShadow(
        color: Color(0xff364dcd).withOpacity(0.25),
        offset: Offset(0, 0),
      ),
      BoxShadow(
        color: Colors.white,
        blurRadius: 12,
      ),
    ],
  );
}
