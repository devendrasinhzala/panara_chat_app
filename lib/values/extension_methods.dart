import 'package:flutter/material.dart';

extension DoubleX on double {
  Widget get verticalSpace {
    return SizedBox(
      height: toDouble(),
    );
  }

  Widget get horizontalSpace {
    return SizedBox(
      width: toDouble(),
    );
  }
}
