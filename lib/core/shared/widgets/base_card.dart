import 'package:eddie_the_dev_frontend/core/constants/app_constants.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class BaseCard extends StatelessWidget {
  final Widget child;
  final Color? bgColor;
  final Color? borderColor;

  const BaseCard({
    super.key,
    required this.child,
    this.bgColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: bgColor ?? context.colorScheme.onPrimary.withAlpha(100),
        borderRadius: BorderRadius.circular(kBaseBorderRadius),
        boxShadow: [
          BoxShadow(
            color: borderColor ?? context.colorScheme.primary.withAlpha(150),
            blurStyle: BlurStyle.outer,
            spreadRadius: 3,
            blurRadius: 3,
          ),
        ],
      ),
      child: child,
    );
  }
}
