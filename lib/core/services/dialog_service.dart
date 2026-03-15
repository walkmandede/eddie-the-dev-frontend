import 'package:flutter/material.dart';

DialogRoute? dialogRoute;

class DialogService {
  static void dismissDialog({required BuildContext context}) {
    try {
      if (dialogRoute != null) {
        Navigator.of(context).removeRoute(dialogRoute!);
        dialogRoute = null;
      }
    } catch (_) {}
  }

  // Future<void> showConfirmDialog({
  //   required BuildContext context,
  //   String label = "Are you sure?",
  //   String? yesLabel,
  //   String? noLabel,
  //   Function()? onClickYes,
  //   Function()? onClickNo,
  // }) async {
  //   if (dialogRoute != null) {
  //     dismissDialog(context: context);
  //   }

  //   dialogRoute = DialogRoute(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) {
  //       return Dialog(
  //         shape: RoundedRectangleBorder(
  //             borderRadius:
  //                 BorderRadius.circular(kBasePaddingM)),
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(
  //             horizontal: AppConstants.basePaddingL,
  //             vertical: AppConstants.basePaddingL,
  //           ),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Text(
  //                 label,
  //                 style: TextStyle(
  //                     fontSize: AppConstants.baseFontSizeL,
  //                     color: getTheme().text1,
  //                     fontWeight: FontWeight.w600),
  //                 textAlign: TextAlign.center,
  //               ),
  //               const SizedBox(
  //                 height: 20,
  //               ),
  //               Row(
  //                 children: [
  //                   Expanded(
  //                     child: CustomOutlinedButton(
  //                       label: (noLabel ?? "Cancel"),
  //                       onPressed: () {
  //                         if (onClickNo != null) onClickNo();
  //                         dismissDialog(context: context);
  //                       },
  //                       size: const Size(
  //                           double.infinity, AppConstants.baseButtonHeightMS),
  //                     ),
  //                   ),
  //                   const SizedBox(
  //                     width: 10,
  //                   ),
  //                   Expanded(
  //                     child: CustomFilledButton(
  //                       label: (yesLabel ?? "Confirm"),
  //                       onPressed: () {
  //                         if (onClickYes != null) onClickYes();
  //                         dismissDialog(context: context);
  //                       },
  //                       borderRadius: 10000,
  //                       baseColor: getTheme().primary,
  //                       labelColor: getTheme().onPrimary,
  //                       size: const Size(
  //                           double.infinity, AppConstants.baseButtonHeightMS),
  //                     ),
  //                   ),
  //                 ],
  //               )
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  //   Navigator.of(context).push(dialogRoute!);
  // }

  static Future<void> showCustomDialog({
    required BuildContext context,
    required Widget widget,
  }) async {
    if (dialogRoute != null) {
      dismissDialog(context: context);
    }

    dialogRoute = DialogRoute(
      context: context,
      barrierDismissible: false,

      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.zero,
          backgroundColor: Colors.transparent,
          child: widget,
        );
      },
    );
    Navigator.of(context).push(dialogRoute!);
  }

  // Future<void> showLoadingDialog({required BuildContext context}) async {
  //   if (dialogRoute != null) {
  //     dismissDialog(context: context);
  //   }

  //   dialogRoute = DialogRoute(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) {
  //       return Dialog(
  //         backgroundColor: Colors.transparent,
  //         elevation: 0,
  //         child: Padding(
  //           padding: const EdgeInsets.symmetric(
  //               horizontal: AppConstants.basePaddingL,
  //               vertical: AppConstants.basePaddingL),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: [
  //                   Card(
  //                     shape: const CircleBorder(),
  //                     color: Theme.of(context).scaffoldBackgroundColor,
  //                     child: Padding(
  //                         padding: const EdgeInsets.all(10),
  //                         child: CupertinoActivityIndicator(
  //                           color: Theme.of(context).primaryColor,
  //                         )),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  //   Navigator.of(context).push(dialogRoute!);
  // }
}
