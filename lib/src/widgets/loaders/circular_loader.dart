import 'package:flutter/material.dart';

import 'package:moon_design/src/theme/loaders/circular_loader/circular_loader_size_properties.dart';
import 'package:moon_design/src/theme/theme.dart';
import 'package:moon_design/src/widgets/common/progress_indicators/circular_progress_indicator.dart';

enum MoonCircularLoaderSize { x2s, xs, sm, md, lg }

class MoonCircularLoader extends StatelessWidget {
  /// The color of the circular loader.
  final Color? color;

  /// The background color of the circular loader.
  final Color? backgroundColor;

  /// The custom size value of the circular loader. For predefined sizes, use
  /// [circularLoaderSize].
  final double? sizeValue;

  /// The width of the stroke for the circular loader.
  final double? strokeWidth;

  /// The size of the circular loader.
  final MoonCircularLoaderSize? circularLoaderSize;

  /// The shape of the end of the stroke (stroke-cap) for the circular loader.
  final StrokeCap? strokeCap;

  /// Creates a Moon Design circular loader.
  const MoonCircularLoader({
    super.key,
    this.color,
    this.backgroundColor,
    this.sizeValue,
    this.strokeWidth,
    this.circularLoaderSize,
    this.strokeCap,
  });

  MoonCircularLoaderSizeProperties _getMoonLoaderSize(
    BuildContext context,
    MoonCircularLoaderSize? moonLoaderSize,
  ) {
    switch (moonLoaderSize) {
      case MoonCircularLoaderSize.x2s:
        return context.moonTheme.circularLoaderTheme.sizes.x2s;
      case MoonCircularLoaderSize.xs:
        return context.moonTheme.circularLoaderTheme.sizes.xs;
      case MoonCircularLoaderSize.sm:
        return context.moonTheme.circularLoaderTheme.sizes.sm;
      case MoonCircularLoaderSize.md:
        return context.moonTheme.circularLoaderTheme.sizes.md;
      case MoonCircularLoaderSize.lg:
        return context.moonTheme.circularLoaderTheme.sizes.lg;
      default:
        return context.moonTheme.circularLoaderTheme.sizes.md;
    }
  }

  @override
  Widget build(BuildContext context) {
    final MoonCircularLoaderSizeProperties effectiveLoaderSize =
        _getMoonLoaderSize(context, circularLoaderSize);

    final Color effectiveColor =
        color ?? context.moonTheme.circularLoaderTheme.colors.color;

    final Color effectiveBackgroundColor =
        backgroundColor ??
        context.moonTheme.circularLoaderTheme.colors.backgroundColor;

    final double effectiveSize =
        sizeValue ?? effectiveLoaderSize.loaderSizeValue;

    final double effectiveStrokeWidth =
        strokeWidth ?? effectiveLoaderSize.loaderStrokeWidth;

    final StrokeCap effectiveStrokeCap = strokeCap ?? StrokeCap.round;

    return SizedBox(
      height: effectiveSize,
      width: effectiveSize,
      child: MoonCircularProgressIndicator(
        color: effectiveColor,
        backgroundColor: effectiveBackgroundColor,
        strokeWidth: effectiveStrokeWidth,
        strokeCap: effectiveStrokeCap,
      ),
    );
  }
}
