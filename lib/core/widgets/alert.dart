import 'dart:async';

import 'package:flutter/material.dart';

class InstanceAlert {
  BuildContext context;

  InstanceAlert(this.context, {Key? key});

  Future<void> showMyDialog(Widget widget) async {
    return showDialog<void>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Dialog(
          alignment: Alignment.bottomCenter,
          insetPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          )),
          child: SingleChildScrollView(
            child: widget,
          ),
        );
      },
    );
  }

  Future<void> showbottomSheetDialog({
    required Widget widget,
    required AnimationController? animation,
    bool isDismissable = true,
  }) {
    return showModalBottomSheet<Widget>(
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        )),
        transitionAnimationController: animation,
        context: context,
        isDismissible: isDismissable,
        builder: (context) {
          return SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: widget,
          ));
        });
  }
}
