import 'package:fixiconn/model/videostatemodel/current_video_state_model.dart';
import 'package:fixiconn/provider/reels_page_state/current_reels_page.dart';
import 'package:fixiconn/provider/videostate/video_controller_provider.dart';
import 'package:fixiconn/top_level_widget/my_text.dart';
import 'package:fixiconn/ui/home_page.dart';
import 'package:fixiconn/utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/videostatemodel/video_state_model.dart';
import '../provider/videostate/video_state.dart';
import 'reels/reels_page.dart';

class Landing extends ConsumerStatefulWidget {
  const Landing({super.key});

  @override
  ConsumerState<Landing> createState() => _LandingState();
}

class _LandingState extends ConsumerState<Landing> {
  int _selectedIndex = 2;
  PageController pageController = PageController(initialPage: 2);
  List<MapEntry> get list => [
        const MapEntry(0, {"path": "layer", "title": "Mini Apps"}),
        const MapEntry(1, {"path": "chat", "title": "Messages"}),
        const MapEntry(3, {"path": "notification", "title": "Notifications"}),
        const MapEntry(4, {"path": "profile", "title": "Profile"}),
      ];

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CurrentVideoStateModel? videoController =
        ref.watch(videoControllerProviderNotifier);
    int currentReelsPage = ref.watch(currentReelsPageNotifier);
    VideoStateModel value = ref.watch(videoStateNotifier);

    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: [
          Scaffold(
            body: PageView(
              controller: pageController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (value) {
                ref
                    .read(currentReelsPageNotifier.notifier)
                    .updateCurrentPageIndex(value);
              },
              children: const [
                HomePage(),
                Scaffold(),
                ReelsPage(),
                Scaffold(),
                Scaffold()
              ],
            ),
            bottomNavigationBar: Container(
              height: 60 + MediaQuery.of(context).viewPadding.bottom,
              decoration: const BoxDecoration(
                color: Color(0xFF000000),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x660C0C0D),
                      offset: Offset(0, 16),
                      blurRadius: 32,
                      spreadRadius: -8),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _item(list[0].key, list[0].value),
                  _item(list[1].key, list[1].value),
                  SizedBox(
                    width: getWidth(75, context),
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        _selectedIndex = 2;
                        setState(() {});
                        if (pageController.page!.round() != 2) {
                          pageController.jumpToPage(2);
                        } else {
                          _pickVideo();
                        }
                      },
                      child: Column(
                        children: [
                          const SizedBox(height: 7),
                          Image.asset("assets/add.png", height: 44, width: 44),
                        ],
                      ),
                    ),
                  ),
                  _item(list[2].key, list[2].value),
                  _item(list[3].key, list[3].value),
                ],
              ),
            ),
          ),
          if (!value.showComments && currentReelsPage == 2)
            Positioned(
                bottom: 55 + MediaQuery.of(context).viewPadding.bottom,
                left: -5,
                right: -5,
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 1.0,
                    trackShape: const RectangularSliderTrackShape(),
                    overlayShape: SliderComponentShape.noOverlay,
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 5.0),
                  ),
                  child: Slider(
                      thumbColor: Colors.white,
                      activeColor: Colors.white,
                      inactiveColor: Colors.white,
                      overlayColor: const WidgetStatePropertyAll(Colors.white),
                      value: ((videoController?.currentPosition.inMilliseconds
                                      .toDouble() ??
                                  0) <
                              0)
                          ? 0
                          : (videoController?.currentPosition.inMilliseconds
                                  .toDouble() ??
                              0),
                      max: videoController?.totalDuration.inMilliseconds
                              .toDouble() ??
                          1,
                      onChanged: (_) {
                        videoController?.videoPlayerController
                            .seekTo(Duration(milliseconds: _.toInt()));
                      }),
                )),
          if (!value.showComments)
            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              left: (getWidth(75, context) * _selectedIndex) +
                  getWidth(34, context),
              bottom: 58 + MediaQuery.of(context).viewPadding.bottom,
              child: Container(
                  width: 8,
                  height: 4,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4))),
            ),
        ],
      ),
    );
  }

  _item(int index, Map e) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        _selectedIndex = index;
        setState(() {});
        pageController.jumpToPage(index);
      },
      child: SizedBox(
        width: getWidth(75, context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Image.asset("assets/icons/${e['path']}.png", height: 24, width: 24),
            const SizedBox(height: 4),
            MyAutoText(
                text: e['title'],
                maxlines: 1,
                fontSize: 10,
                color: const Color(0xff93A2B7))
          ],
        ),
      ),
    );
  }

  void _pickVideo() {}
}
