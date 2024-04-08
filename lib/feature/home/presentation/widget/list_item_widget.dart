import 'package:babalomoda/core/config/orientation_helper.dart';
import 'package:babalomoda/feature/home/data/model/top_story_model.dart';
import 'package:babalomoda/feature/home/presentation/screen/article_detais_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListItemWidget extends StatelessWidget {
  const ListItemWidget({super.key, required this.story});

  final TopStoryModel story;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
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
            margin: EdgeInsets.only(top: 8.h),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  if (story.multimedia?.isNotEmpty ?? false)
                    Expanded(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.r),
                      child: Image.network(
                        story.multimedia!.first.url,
                        height: 120.h,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    )),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                      flex: OrientationHelper.isPortrait(context) ? 1 : 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 55.h,
                            child: Text(
                              story.title,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
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
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          story.publishedDate.replaceAll('T', ' ').substring(0, 19),
          style: TextStyle(
              fontSize: OrientationHelper.isPortrait(context) ? 10.sp : 4.sp),
        ),
        SizedBox(
          height: 5.h,
        )
      ],
    );
  }
}
