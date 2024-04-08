import 'package:babalomoda/core/config/orientation_helper.dart';
import 'package:babalomoda/core/widgets/alert.dart';
import 'package:babalomoda/feature/home/presentation/provider/home_provider.dart';
import 'package:babalomoda/feature/home/presentation/widget/filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class HeaderWidget extends StatelessWidget {
  HeaderWidget({super.key, this.animation});

  final AnimationController? animation;
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: TextFormField(
            focusNode: focusNode,
            controller: context.read<HomeProvider>().searchController,
            onChanged: (value) {
              context.read<HomeProvider>().changeSearch(value);
            },
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  size: OrientationHelper.isPortrait(context) ? 15.h : 10.w,
                  color: Colors.amber,
                ),
                suffix: IconButton(
                    onPressed: () {
                      context.read<HomeProvider>().clearSearch();
                      focusNode.unfocus();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: Colors.amber,
                    )),
                label: Text(
                  'Search',
                  style: TextStyle(
                    fontSize:
                        OrientationHelper.isPortrait(context) ? 14.sp : 10.sp,
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
                  widget: const FilterWidget(), animation: animation);
            },
            child: Row(
              children: [
                Consumer<HomeProvider>(
                  builder: (context, provider, child) => SvgPicture.asset(
                    'assets/icons/filter.svg',
                    height: OrientationHelper.isPortrait(context) ? 15.h : 10.w,
                    colorFilter: ColorFilter.mode(
                        provider.selectedSection == ''
                            ? Colors.black
                            : Colors.amber,
                        BlendMode.srcIn),
                  ),
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  'Filter',
                  style: TextStyle(
                      fontSize:
                          OrientationHelper.isPortrait(context) ? 12.sp : 8.sp),
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
                iconButton(context, 'list', !provider.isGrid, () {
                  provider.changeListView(gridVal: false);
                }),
                iconButton(context, 'grid', provider.isGrid, () {
                  provider.changeListView(gridVal: true);
                }),
              ],
            );
          }),
        )
      ],
    );
  }

  Widget iconButton(BuildContext context, String iconName, bool isGrid,
          void Function() onTap) =>
      GestureDetector(
          onTap: onTap,
          child: SvgPicture.asset(
            'assets/icons/$iconName.svg',
            height: OrientationHelper.isPortrait(context) ? 15.h : 10.w,
            colorFilter: ColorFilter.mode(
                isGrid ? Colors.amber : Colors.black, BlendMode.srcIn),
          ));
}
