import 'package:babalomoda/core/config/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSnakbar {
  final BuildContext context;

  CustomSnakbar(this.context);

  showMessage({required String message, required MessageState messageState}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset('assets/icons/${messageState.name}.svg'),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(getTitle(messageState)),
              SizedBox(
                width: 250.w,
                child: Text(
                  message,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: Colors.grey, fontSize: 10),
                  overflow: TextOverflow.fade,
                  softWrap: true,
                  // textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }

  String getTitle(MessageState state) {
    switch (state) {
      case MessageState.success:
        return 'success';

      case MessageState.error:
        return 'error';

      case MessageState.info:
        return 'info';
    }
  }
}
