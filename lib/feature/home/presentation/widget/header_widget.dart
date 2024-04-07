import 'package:babalomoda/core/widgets/alert.dart';
import 'package:babalomoda/feature/home/presentation/provider/home_provider.dart';
import 'package:babalomoda/feature/home/presentation/widget/filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key, this.animation});

  final AnimationController? animation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: TextFormField(
            controller: context.read<HomeProvider>().searchController,
            onChanged: (value) {
                context.read<HomeProvider>().changeSearch(value);
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: const Icon(Icons.search),
                label: Text(
                  'Search',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xffC5C5C5),
                  ),
                )),
          ),
        ),
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () {
              InstanceAlert(context).showbottomSheetDialog(
                  widget: FilterWidget(), animation: animation);
            },
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/filter.svg',
                  height: 15.h,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  'Filter',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ],
            ),
          ),
        ),
        Expanded(child: Container()),
        Expanded(
          flex: 2,
          child: Consumer<HomeProvider>(builder: (context, provider, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                iconButton('list', !provider.isGrid, () {
                  provider.changeListView(gridVal: false);
                }),
                iconButton('grid', provider.isGrid, () {
                  provider.changeListView(gridVal: true);
                }),
              ],
            );
          }),
        )
      ],
    );
  }

  Widget iconButton(String iconName, bool isGrid, void Function() onTap) =>
      GestureDetector(
          onTap: onTap,
          child: SvgPicture.asset(
            'assets/icons/$iconName.svg',
            height: 15.h,
            colorFilter: ColorFilter.mode(
                isGrid ? Colors.amber : Colors.black, BlendMode.srcIn),
          ));
}
