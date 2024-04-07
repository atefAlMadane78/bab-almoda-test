import 'package:babalomoda/feature/home/data/model/top_story_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            Stack(
              children:[ ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: Image.network(
                  story.multimedia.first.url,
                  height: ScreenUtil().screenHeight * .3,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.amber, width: .3),
                  borderRadius: BorderRadius.only(bottomRight:Radius.circular(8.r))
                ),
                padding: EdgeInsets.all(5.h),
                child: Text('${story.section} - ${story.subsection}'.toUpperCase(),
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold, color: Colors.amber),
                ),
              )
              ]
            ),
            Container(
              height: ScreenUtil().screenHeight * .5,
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      story.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(story.desFacet.first),
                    SizedBox(
                      height: 8.h,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        story.byline,
                        style: TextStyle(fontSize: 10.sp),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                story.publishedDate.replaceAll('T', ' ').substring(0, 19),
                style: TextStyle(fontSize: 10.sp),
              ),
            )
          ],
        ),
      ),
    );
  }
}
