import 'package:fixiconn/provider/reels_page_state/current_reels_page.dart';
import 'package:fixiconn/top_level_widget/my_text.dart';
import 'package:fixiconn/utilities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:preload_page_view/preload_page_view.dart';
import '../../data.dart';
import '../../model/theme/custom_theme.dart';
import '../../model/videostatemodel/video_state_model.dart';
import '../../provider/theme/theme_notifier.dart';
import '../../provider/videostate/video_state.dart';
import 'video_item.dart';

class ReelsPage extends ConsumerStatefulWidget {
  const ReelsPage({super.key});

  @override
  ConsumerState<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends ConsumerState<ReelsPage>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 2);
  late TabController _tabController;
  int _selectedIndex = 2;
  int _currentVideoIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 2);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    VideoStateModel value = ref.watch(videoStateNotifier);
    CustomTheme theme = ref.watch(themeNotifierProvider);

    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: theme.backgroundColor,
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (value) {
                ref
                    .read(currentReelsPageNotifier.notifier)
                    .updateCurrentPageIndex(value);
              },
              children: [
                Container(),
                Container(),
                PreloadPageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: mediaJSON.length,
                    preloadPagesCount: 3,
                    onPageChanged: (value) => _currentVideoIndex = value,
                    itemBuilder: (_, index) {
                      return VideoItem(
                          data: mediaJSON[index],
                          index: index,
                          isCurrentIndex: _currentVideoIndex == index);
                    }),
              ],
            ),
            if (!value.showComments) _top()
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;

  _top() {
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).viewPadding.top + 15,
          left: 20,
          right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset("assets/menu.png", width: 20),
          SizedBox(
            width: getWidth(250, context),
            child: TabBar(
                controller: _tabController,
                labelPadding: EdgeInsets.zero,
                onTap: (value) {
                  _selectedIndex = value;
                  setState(() {});
                  _pageController.animateToPage(_selectedIndex,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.linear);
                },
                padding: EdgeInsets.zero,
                dividerColor: Colors.transparent,
                indicator: UnderlineTabIndicator(
                    insets: const EdgeInsets.only(left: 8, right: 8),
                    borderRadius: BorderRadius.circular(100),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2)),
                tabs: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: MyText(
                        text: "LIVE",
                        fontSize: 12,
                        color: Colors.white,
                        maxlines: 1,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: _selectedIndex == 0
                            ? FontWeight.w700
                            : FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: MyText(
                        text: "Following",
                        fontSize: 12,
                        color: Colors.white,
                        maxlines: 1,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: _selectedIndex == 1
                            ? FontWeight.w700
                            : FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: MyText(
                        text: "For You",
                        fontSize: 12,
                        color: Colors.white,
                        maxlines: 1,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: _selectedIndex == 2
                            ? FontWeight.w700
                            : FontWeight.w500),
                  )
                ]),
          ),
          Image.asset("assets/search-normal.png", width: 20)
        ],
      ),
    );
  }
}
