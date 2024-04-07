// ignore_for_file: use_build_context_synchronously

import 'package:babalomoda/feature/home/presentation/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class FilterWidget extends StatefulWidget {
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
            Text(
              'Chooes Section',
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: value.allSections
                    .length, // Change this to the number of items you have
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
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
                          vertical: 5.h, horizontal: 8.w),
                      alignment: Alignment.center,
                      child: Text(value.allSections[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: value.selectedSection ==
                                      value.allSections[index]
                                  ? Colors.white
                                  : Colors.amber,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
