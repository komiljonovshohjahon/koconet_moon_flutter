import 'package:flutter/material.dart';

import 'package:moon_design/src/theme/theme.dart';
import 'package:moon_design/src/widgets/progress_pin/pin_style.dart';
import 'package:moon_design/src/widgets/progress_pin/progress_pin_painter.dart';

class MoonProgressPin extends StatelessWidget {
  final double progressValue;
  final PinStyle? pinStyle;
  final String pinText;
  final Widget child;

  /// Creates a Moon Design progress pin.
  const MoonProgressPin({
    super.key,
    required this.progressValue,
    this.pinStyle,
    required this.pinText,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectivePinColor =
        pinStyle?.pinColor ??
        context.moonTheme.progressPinTheme.colors.pinColor;

    final Color effectivePinBorderColor =
        pinStyle?.pinBorderColor ??
        context.moonTheme.progressPinTheme.colors.pinBorderColor;

    final Color effectiveThumbColor =
        pinStyle?.thumbColor ??
        context.moonTheme.progressPinTheme.colors.thumbColor;

    final Color effectiveShadowColor =
        pinStyle?.shadowColor ??
        context.moonTheme.progressPinTheme.colors.shadowColor;

    final Color effectiveTextColor =
        pinStyle?.textStyle?.color ??
        context.moonTheme.progressPinTheme.colors.textColor;

    final TextStyle effectiveTextStyle =
        pinStyle?.textStyle ??
        context.moonTheme.progressPinTheme.properties.textStyle;

    final double effectivePinWidth =
        pinStyle?.pinWidth ??
        context.moonTheme.progressPinTheme.properties.pinWidth;

    final double effectivePinBorderWidth =
        pinStyle?.pinBorderWidth ??
        context.moonTheme.progressPinTheme.properties.pinBorderWidth;

    final double effectivePinDistance =
        pinStyle?.pinDistance ??
        context.moonTheme.progressPinTheme.properties.pinDistance;

    final double effectiveArrowHeight =
        pinStyle?.arrowHeight ??
        context.moonTheme.progressPinTheme.properties.arrowHeight;

    final double effectiveArrowWidth =
        pinStyle?.arrowWidth ??
        context.moonTheme.progressPinTheme.properties.arrowWidth;

    final double effectiveShadowElevation =
        pinStyle?.shadowElevation ??
        context.moonTheme.progressPinTheme.properties.shadowElevation;

    final TextDirection effectiveTextDirection = Directionality.of(context);

    return CustomPaint(
      foregroundPainter: ProgressPinPainter(
        showShadow: pinStyle?.showShadow ?? true,
        pinColor: effectivePinColor,
        thumbColor: effectiveThumbColor,
        shadowColor: effectiveShadowColor,
        pinBorderColor: effectivePinBorderColor,
        pinBorderWidth: effectivePinBorderWidth,
        arrowHeight: effectiveArrowHeight,
        arrowWidth: effectiveArrowWidth,
        pinDistance: effectivePinDistance,
        pinWidth: effectivePinWidth,
        thumbSizeValue: pinStyle?.thumbSizeValue,
        progressValue: progressValue,
        shadowElevation: effectiveShadowElevation,
        pinText: pinText,
        textDirection: effectiveTextDirection,
        textStyle: effectiveTextStyle.copyWith(color: effectiveTextColor),
      ),
      child: child,
    );
  }
}
