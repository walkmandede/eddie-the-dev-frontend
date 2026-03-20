import 'package:flutter/widgets.dart';

extension DoubleExtension on double {
  SizedBox widthBox() => SizedBox(width: this);
  SizedBox heightBox() => SizedBox(height: this);

  int get alphaValue => (255 * this).toInt();
}
