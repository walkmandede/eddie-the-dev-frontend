import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../constants/app_constants.dart';

class AppResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context) verticalBuilder;
  final Widget Function(BuildContext context)? horizontalBuilder;

  const AppResponsiveBuilder({
    super.key,
    required this.verticalBuilder,
    this.horizontalBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isVertical = constraints.maxWidth < constraints.maxHeight;

        final Widget child = isVertical
            ? verticalBuilder(context)
            : horizontalBuilder != null
            ? horizontalBuilder!(context)
            : Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: kStandardMaxWidthForPortraitOrientation,
                  ),
                  child: verticalBuilder(context),
                ),
              );

        if (!kDebugMode) return child;
        return Stack(
          children: [
            child,
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: (isVertical ? Colors.teal : Colors.orange).withAlpha(50),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  "${isVertical ? "V" : "H"} "
                  "${constraints.maxWidth.toInt()} x ${constraints.maxHeight.toInt()}",
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
