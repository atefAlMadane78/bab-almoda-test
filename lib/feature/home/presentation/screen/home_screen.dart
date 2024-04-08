import 'package:babalomoda/core/config/enum.dart';
import 'package:babalomoda/core/config/orientation_helper.dart';
import 'package:babalomoda/core/widgets/loading_widget.dart';
import 'package:babalomoda/feature/home/data/model/top_story_model.dart';
import 'package:babalomoda/feature/home/presentation/provider/home_provider.dart';
import 'package:babalomoda/feature/home/presentation/widget/grid_item_widget.dart';
import 'package:babalomoda/feature/home/presentation/widget/header_widget.dart';
import 'package:babalomoda/feature/home/presentation/widget/list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScrenn extends StatefulWidget {
  const HomeScrenn({super.key});

  @override
  State<HomeScrenn> createState() => _HomeScrennState();
}

class _HomeScrennState extends State<HomeScrenn> with TickerProviderStateMixin {
  AnimationController? animation;

  @override
  void initState() {
    animation = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    Future.delayed(Duration.zero, () {
      context.read<HomeProvider>().getTopStories(section: 'home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          children: [
            HeaderWidget(animation: animation),
            Expanded(child:
                Consumer<HomeProvider>(builder: (context, provider, child) {
              List<TopStoryModel> filterStories = [];
              if (provider.selectedSection == '') {
                filterStories = provider.topStories;
              } else {
                for (var story in provider.topStories) {
                  if (story.section == provider.selectedSection) {
                    filterStories.add(story);
                  }
                }
              }

              if (provider.searchController.text.isNotEmpty) {
                List<TopStoryModel> swap = filterStories;
                filterStories = [];

                for (var story in swap) {
                  if (story.byline.toLowerCase().contains(
                          provider.searchController.text.toLowerCase()) ||
                      story.title.toLowerCase().contains(
                          provider.searchController.text.toLowerCase())) {
                    filterStories.add(story);
                  }
                }
              }

              return provider.dataState == DataState.faild
                  ? Center(
                      child: Text(
                      provider.message,
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
                  : filterStories.isEmpty
                      ? const Center(
                          child: Text(
                          'There is no stories found',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ))
                      : provider.isGrid
                          ? Column(
                              children: [
                                if (provider.dataState == DataState.loading)
                                  const LoadingWidget(),
                                Expanded(
                                  child: GridView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio:OrientationHelper.isPortrait(context) ?  .5.sp: .7.sp),
                                    itemCount: filterStories.length,
                                    itemBuilder: (context, index) {
                                      return GridItemWidget(
                                          story: filterStories[index]);
                                    },
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                if (provider.dataState == DataState.loading)
                                  const LoadingWidget(),
                                Expanded(
                                  child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: filterStories.length,
                                    itemBuilder: (context, index) {
                                      return ListItemWidget(
                                          story: filterStories[index]);
                                    },
                                  ),
                                ),
                              ],
                            );
            }))
          ],
        ),
      )),
    );
  }
}
