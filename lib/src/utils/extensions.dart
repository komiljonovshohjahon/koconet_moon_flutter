import 'package:flutter/material.dart';

import 'package:moon_design/src/utils/squircle/squircle_border_radius.dart';
import 'package:moon_design/src/utils/squircle/squircle_radius.dart';

extension BuildContextX on BuildContext {
  /// Whether the active application theme uses dark mode.
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}

extension BorderRadiusGeometryX on BorderRadiusGeometry {
  /// Returns the MoonSquircleBorderRadius.
  MoonSquircleBorderRadius squircleBorderRadius(BuildContext context) {
    final borderRadius = resolve(Directionality.of(context));

    return MoonSquircleBorderRadius.only(
      topLeft: MoonSquircleRadius(cornerRadius: borderRadius.topLeft.x),
      topRight: MoonSquircleRadius(cornerRadius: borderRadius.topRight.x),
      bottomLeft: MoonSquircleRadius(cornerRadius: borderRadius.bottomLeft.x),
      bottomRight: MoonSquircleRadius(cornerRadius: borderRadius.bottomRight.x),
    );
  }
}
