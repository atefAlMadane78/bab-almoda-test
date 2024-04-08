import 'package:babalomoda/core/config/orientation_helper.dart';
import 'package:babalomoda/core/network/WebBrowser.dart';
import 'package:babalomoda/feature/home/data/model/top_story_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({super.key, required this.story});

  final TopStoryModel story;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
            )),
        title: Text(
          story.title,
          style: const TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: OrientationHelper.isPortrait(context)
            ? const NeverScrollableScrollPhysics()
            : const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            if (story.multimedia?.isNotEmpty ?? false)
              Stack(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.r),
                  child: Image.network(
                    story.multimedia!.first.url,
                    height: OrientationHelper.isPortrait(context)
                        ? ScreenUtil().screenHeight * .3
                        : ScreenUtil().screenHeight * .5,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.amber, width: .3),
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(8.r))),
                  padding: EdgeInsets.all(5.h),
                  child: Text(
                    '${story.section} ${story.section.isNotEmpty && story.subsection.isNotEmpty ? '-' : ''} ${story.subsection}'
                        .toUpperCase(),
                    style: TextStyle(
                        fontSize: OrientationHelper.isPortrait(context)
                            ? 10.sp
                            : 6.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber),
                  ),
                )
              ]),
            Container(
              height: OrientationHelper.isPortrait(context)
                  ? ScreenUtil().screenHeight * .5
                  : ScreenUtil().screenHeight * .7,
              margin: EdgeInsets.symmetric(
                vertical: 15.h,
              ),
              padding: EdgeInsets.all(12.h),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5), // Shadow color
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    story.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:
                          OrientationHelper.isPortrait(context) ? 16.sp : 12.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Divider(
                    height: 50.h,
                    indent: ScreenUtil().screenWidth * .1,
                    endIndent: ScreenUtil().screenWidth * .1,
                    color: Colors.black.withOpacity(.5),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '${story.desFacet.first} ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: OrientationHelper.isPortrait(context)
                                  ? 14.sp
                                  : 8.sp,
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: 'see more..',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          WebBrowser(story.url, story.title)),
                                ),
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: OrientationHelper.isPortrait(context)
                                ? 14.sp
                                : 6.sp,
                            color: Colors.blue.withOpacity(.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      story.byline,
                      style: TextStyle(
                          fontSize: OrientationHelper.isPortrait(context)
                              ? 10.sp
                              : 6.sp),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                story.publishedDate.replaceAll('T', ' ').substring(0, 19),
                style: TextStyle(
                    fontSize:
                        OrientationHelper.isPortrait(context) ? 10.sp : 6.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
