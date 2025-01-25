import 'package:fixiconn/model/videostatemodel/current_video_state_model.dart';
import 'package:fixiconn/provider/videostate/update_likes.dart';
import 'package:fixiconn/provider/videostate/video_controller_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:focus_detector_v2/focus_detector_v2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import '../../../utilities.dart';
import '../../model/videostatemodel/video_state_model.dart';
import '../../provider/videostate/video_state.dart';
import '../../top_level_widget/my_text.dart';
import 'comments/comments.dart';

class VideoItem extends ConsumerStatefulWidget {
  final int index;
  final Map data;
  final bool isCurrentIndex;
  const VideoItem(
      {super.key,
      required this.index,
      required this.data,
      required this.isCurrentIndex});

  @override
  ConsumerState<VideoItem> createState() => _VideoItemState();
}

class _VideoItemState extends ConsumerState<VideoItem>
    with AutomaticKeepAliveClientMixin {
  VideoPlayerController? _videoController;

  late AnimationController animationController;
  bool isPause = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: Navigator.of(context),
      duration: const Duration(milliseconds: 300),
    );
    animationController.addListener(_animationListener);
    _videoController = VideoPlayerController.networkUrl(
        Uri.parse(widget.data['sources'][0]),
        videoPlayerOptions: VideoPlayerOptions())
      ..initialize().then(
        (_) {
          setState(() {});
        },
      )
      ..setLooping(true);
    _videoController?.addListener(_videoListener);
  }

  @override
  void dispose() async {
    super.dispose();
    animationController.removeListener(_animationListener);
    animationController.dispose();
    _videoController?.removeListener(_videoListener);
    await _videoController?.dispose().then((value) {
      WakelockPlus.disable();
      _videoController = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    VideoStateModel value = ref.watch(videoStateNotifier);
    Map<String, bool> like = ref.watch(updateLikesNotifier);
    double screenRatio = MediaQuery.of(context).size.aspectRatio;

    return Scaffold(
      backgroundColor: const Color(0xff0F172A),
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (!isPause) {
            _videoController?.pause();
            isPause = true;
          } else {
            _videoController?.play();
            isPause = false;
          }
          setState(() {});
        },
        onDoubleTap: () {
          _updateLikes(like);
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width),
            Align(
              alignment: const Alignment(0.0, -1.05),
              child: SizedBox(
                height: _height(value),
                width: _width(value),
                child: Center(
                    child: FocusDetector(
                  key: Key(widget.index.toString()),
                  onFocusLost: () {
                    ref
                        .read(videoStateNotifier.notifier)
                        .updateShowPauesButton(true);
                    _videoController?.pause();
                  },
                  onFocusGained: () {
                    ref
                        .read(videoControllerProviderNotifier.notifier)
                        .updateCurrentVideoController(CurrentVideoStateModel(
                            videoPlayerValue: _videoController!.value,
                            videoPlayerController: _videoController!));
                    if (!isPause) {
                      _videoController?.play();
                      ref
                          .read(videoStateNotifier.notifier)
                          .updateShowPauesButton(false);
                    }
                  },
                  isWidgetTest: false,
                  child: _buildVideoPlayer(screenRatio),
                )),
              ),
            ),
            if (!value.showComments)
              Positioned(
                bottom: getHeight(11, context),
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 7),
                          width: 58,
                          child: Column(
                            children: AnimationConfiguration.toStaggeredList(
                              duration: const Duration(milliseconds: 375),
                              childAnimationBuilder: (widget) => SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(child: widget),
                              ),
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.white, width: 1.5)),
                                ),
                                SizedBox(height: getHeight(20, context)),
                                GestureDetector(
                                  onTap: () {
                                    _updateLikes(like);
                                  },
                                  child: Image.asset(
                                    "assets/heart.png",
                                    width: 24,
                                    height: 24,
                                    color: like[widget.data['title']] == true
                                        ? Colors.red
                                        : Colors.white,
                                  ),
                                ),
                                MyText(
                                    text: formatKMBTNumber(125 +
                                        ((like[widget.data['title']] == true
                                            ? 1
                                            : 0))),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    maxlines: 1,
                                    color: Colors.white),
                                SizedBox(height: getHeight(20, context)),
                                GestureDetector(
                                  onTap: () {
                                    _showComments();
                                  },
                                  child: Image.asset(
                                    "assets/comment.png",
                                    width: 24,
                                    height: 24,
                                    color: Colors.white,
                                  ),
                                ),
                                MyText(
                                    text: formatKMBTNumber(17),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    maxlines: 1,
                                    color: Colors.white),
                                SizedBox(height: getHeight(20, context)),
                                GestureDetector(
                                  onTap: () {
                                    _showComments();
                                  },
                                  child: Image.asset(
                                    "assets/bookmark.png",
                                    width: 24,
                                    height: 24,
                                    color: Colors.white,
                                  ),
                                ),
                                MyText(
                                    text: formatKMBTNumber(350),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    maxlines: 1,
                                    color: Colors.white),
                                SizedBox(height: getHeight(20, context)),
                                GestureDetector(
                                  child: Image.asset(
                                    "assets/share.png",
                                    width: 24,
                                    height: 24,
                                    color: Colors.white,
                                  ),
                                ),
                                MyText(
                                    text: formatKMBTNumber(350),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    maxlines: 1,
                                    color: Colors.white),
                                SizedBox(height: getHeight(20, context)),
                                Image.asset("assets/mini-music.png", width: 32)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            if (!value.showComments)
              Positioned(
                bottom: 0,
                left: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: getHeight(10, context)),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: const Color(0xff1A1A1A),
                                    borderRadius: BorderRadius.circular(4)),
                                child: Row(
                                  children: [
                                    Image.asset("assets/shop.png", width: 16),
                                    SizedBox(width: getWidth(4, context)),
                                    const MyText(
                                        text: "Shop",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                    SizedBox(width: getWidth(4, context)),
                                    const CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 1),
                                    SizedBox(width: getWidth(4, context)),
                                    const MyText(
                                        text: "4",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                    SizedBox(width: getWidth(4, context)),
                                    Image.asset("assets/dropdown.png",
                                        width: 10)
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: getHeight(8, context)),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: getWidth(260, context),
                                    child: GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () async {
                                        // await Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (_) =>
                                        //             const Profile(index: 0)));
                                      },
                                      child: const MyText(
                                          text: "Username",
                                          fontSize: 14,
                                          maxlines: 1,
                                          fontWeight: FontWeight.w600,
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(height: getHeight(8, context)),
                                  SizedBox(
                                      width: getWidth(260, context),
                                      child: Text.rich(TextSpan(
                                          text:
                                              "This happens to be a great match!",
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                          children: [
                                            TextSpan(
                                              text: "...see more",
                                              style: GoogleFonts.montserrat(
                                                  color: Colors.white,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ])))
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: getHeight(8, context)),
                          Row(
                            children: [
                              Image.asset("assets/falz.png",
                                  width: getWidth(150, context)),
                              SizedBox(width: getWidth(4, context)),
                              Image.asset("assets/effect.png",
                                  width: getWidth(104, context))
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: getHeight(11, context)),
                  ],
                ),
              ),
            if (isPause && !value.showComments)
              CupertinoButton(
                  onPressed: () {
                    _videoController?.play();
                    isPause = false;
                    setState(() {});
                  },
                  child: AnimatedOpacity(
                    opacity: isPause ? 1 : 0,
                    duration: kThemeAnimationDuration,
                    child: Image.asset("assets/video_play.png",
                        width: 48, height: 48),
                  )),
          ],
        ),
      ),
    );
  }

  _videoListener() async {
    if (widget.isCurrentIndex) {
      ref
          .read(videoControllerProviderNotifier.notifier)
          .updateCurrentVideoValue(_videoController!.value);
    }
    if (!_videoController!.value.isPlaying) {
      ref.read(videoStateNotifier.notifier).updateShowPauesButton(true);
      WakelockPlus.disable();
    } else {
      ref.read(videoStateNotifier.notifier).updateShowPauesButton(false);
      WakelockPlus.enable();
    }
  }

  Widget _buildVideoPlayer(screenRatio) {
    if (_videoController != null && _videoController!.value.isInitialized) {
      return (_videoController!.value.aspectRatio < screenRatio)
          ? SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _videoController!.value.size.width,
                  height: _videoController!.value.size.height,
                  child: VideoPlayer(_videoController!),
                ),
              ),
            )
          : AspectRatio(
              aspectRatio: _videoController!.value.aspectRatio,
              child: VideoPlayer(_videoController!),
            );
    } else {
      return Container();
    }
  }

  void _animationListener() {
    ref
        .read(videoStateNotifier.notifier)
        .updateModalValue(animationController.value);
    VideoStateModel state = ref.read(videoStateNotifier);
    if (animationController.value == 0 && !state.showComments) {
      // subHomeProvider.upHasAction(widget.video.id, false);
    }
  }

  _height(VideoStateModel state) {
    return getHeight(200, context) +
        (getHeight(725, context) * (1 - state.modalValue));
  }

  _width(VideoStateModel state) {
    return MediaQuery.of(context).size.width -
        (getWidth(80, context) * state.modalValue);
  }

  _showComments() {
    ref.read(videoStateNotifier.notifier).updateShowComments(true);
    showModalBottomSheet(
        isScrollControlled: true,
        enableDrag: true,
        context: context,
        transitionAnimationController: animationController,
        barrierColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(45), topLeft: Radius.circular(45))),
        builder: (_) {
          return const Comments();
        }).then((value) {
      ref.read(videoStateNotifier.notifier).updateShowComments(false);
    });
  }

  void _updateLikes(Map<String, bool> like) {
    if (like[widget.data['title']] == true) {
      ref
          .read(updateLikesNotifier.notifier)
          .updateLikes(widget.data['title'], false);
    } else {
      ref
          .read(updateLikesNotifier.notifier)
          .updateLikes(widget.data['title'], true);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
