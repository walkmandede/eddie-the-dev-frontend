import 'package:eddie_the_dev_frontend/core/shared/widgets/app_responsive_builder.dart';
import 'package:eddie_the_dev_frontend/src/features/eddie/widgets/eddie_h_widget.dart';
import 'package:flutter/material.dart';

class EddiePage extends StatelessWidget {
  const EddiePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppResponsiveBuilder(
      verticalBuilder: (context) {
        return EddieHWidget();
      },
      horizontalBuilder: (context) {
        return EddieHWidget();
      },
    );
  }
}
