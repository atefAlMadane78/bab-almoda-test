import 'package:babalomoda/core/config/orientation_helper.dart';
import 'package:babalomoda/feature/home/data/model/top_story_model.dart';
import 'package:babalomoda/feature/home/presentation/screen/article_detais_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridItemWidget extends StatelessWidget {
  const GridItemWidget({super.key, required this.story});

  final TopStoryModel story;

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArticleDetailsScreen(story: story),
              ));
        },
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white,
                border: Border.all(color: Colors.grey, width: .5)),
            padding: EdgeInsets.all(8.h),
            margin: EdgeInsets.symmetric(
              vertical: 12.h,
              horizontal: 5.w,
            ),
            child: Column(
              children: [
                if (story.multimedia?.isNotEmpty ?? false)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5.r),
                    child: Image.network(
                      story.multimedia!.first.url,
                      height:OrientationHelper.isPortrait(context) ?  120.h: 180.h,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  height:OrientationHelper.isPortrait(context) ?  52.h : 78.h,
                  child: Text(
                    story.title,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1.r),
                      color: Colors.grey.withOpacity(.3),
                    ),
                    padding: EdgeInsets.all(5.h),
                    width: double.infinity,
                    child: Text(
                      story.byline,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            )),
      ),
      Positioned.fill(
          right: 8.w,
          bottom:OrientationHelper.isPortrait(context) ?  -2.h: -10.h,
          child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                story.publishedDate.replaceAll('T', ' ').substring(0, 19),
                style: TextStyle(fontSize: OrientationHelper.isPortrait(context) ? 10.sp : 4.sp),
              ))),
    ]);
  }
}
