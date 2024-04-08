// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:babalomoda/core/config/orientation_helper.dart';
import 'package:babalomoda/feature/home/presentation/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      context.read<HomeProvider>().getAllSection();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().screenHeight * .5,
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
      child: Consumer<HomeProvider>(
        builder: (context, value, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Chooes Section',
                  style: TextStyle(
                      fontSize:
                          OrientationHelper.isPortrait(context) ? 16.sp : 12.sp,
                      fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      value.selectedSection == '' ? 'Close' : 'Done',
                      style: const TextStyle(color: Colors.black),
                    ))
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: value.allSections
                    .length, // Change this to the number of items you have
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: .9.sp),
                itemBuilder: (BuildContext context, int index) {
                  return Stack(clipBehavior: Clip.none, children: [
                    GestureDetector(
                      onTap: () {
                        value.chageSection(value.allSections[index]);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: value.selectedSection ==
                                    value.allSections[index]
                                ? Colors.amber
                                : Colors.white,
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                              color: Colors.amber,
                            )),
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 8.w),
                        margin: EdgeInsets.symmetric(
                            vertical: OrientationHelper.isPortrait(context)
                                ? 5.h
                                : 5.w,
                            horizontal: 8.w),
                        alignment: Alignment.center,
                        child: Text(value.allSections[index],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: value.selectedSection ==
                                        value.allSections[index]
                                    ? Colors.white
                                    : Colors.amber,
                                fontSize: OrientationHelper.isPortrait(context)
                                    ? 14.sp
                                    : 10.sp,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    if (value.selectedSection == value.allSections[index])
                      Positioned.fill(
                          right:
                              OrientationHelper.isPortrait(context) ? 0 : 5.w,
                          top: OrientationHelper.isPortrait(context) ? 0 : -3.h,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                value.chageSection(value.allSections[index]);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.amber),
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: const Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ))
                  ]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
