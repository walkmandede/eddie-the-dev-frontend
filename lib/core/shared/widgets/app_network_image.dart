import 'package:eddie_the_dev_frontend/core/services/dialog_service.dart';
import 'package:eddie_the_dev_frontend/core/shared/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class AppNetworkImage extends StatelessWidget {
  final String url;
  final double borderRadius;
  final double? width;
  final double? height;
  final BoxFit boxFit;
  final Widget? errorWidget;

  const AppNetworkImage({
    super.key,
    required this.url,
    this.borderRadius = 0,
    this.width,
    this.height,
    this.boxFit = BoxFit.cover,
    this.errorWidget,
  });

  Widget _baseImage(BuildContext context, BoxFit fit) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(borderRadius),
      child: GestureDetector(
        onTap: () {
          _onClick(context);
        },
        child: Image.network(
          url,
          width: width,
          height: height,

          fit: fit,
          loadingBuilder: (context, child, loadingProgress) {
            if ((loadingProgress?.cumulativeBytesLoaded ?? 0) >= (loadingProgress?.expectedTotalBytes ?? 0)) {
              return child;
            }
            return SizedBox(
              width: 200,
              child: Center(child: CircularProgressIndicator()),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return errorWidget ??
                SizedBox(
                  width: 200,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(borderRadius),
                      border: Border.all(
                        color: context.colorScheme.primary,
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.error),
                        Text(error.toString()),
                      ],
                    ),
                  ),
                );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _baseImage(context, boxFit);
  }

  void _onClick(BuildContext context) async {
    DialogService.showCustomDialog(
      context: context,
      widget: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          leading: BackButton(
            onPressed: () {
              DialogService.dismissDialog(context: context);
            },
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Center(
          child: InteractiveViewer(child: _baseImage(context, BoxFit.contain)),
        ),
      ),
    );
  }
}
