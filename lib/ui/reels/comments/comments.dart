import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../../../../provider/theme/theme_notifier.dart';
import '../../../../utilities.dart';
import '../../../top_level_widget/custom_text_field.dart';
import '../../../top_level_widget/my_text.dart';

class Comments extends ConsumerStatefulWidget {
  const Comments({super.key});

  @override
  ConsumerState<Comments> createState() => _CommentsState();
}

class _CommentsState extends ConsumerState<Comments> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeNotifierProvider);

    return Container(
      height: getHeight(676, context),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: theme.backgroundColor,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(40), topLeft: Radius.circular(40))),
      child: Column(
        children: [
          SizedBox(height: getHeight(7, context)),
          Container(
            width: 63,
            height: 3,
            decoration: BoxDecoration(
                color: const Color(0xff999999),
                borderRadius: BorderRadius.circular(10)),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                    text: "${formatKMBTNumber(4568)} Comments",
                    fontSize: 16,
                    color: theme.textColor,
                    fontWeight: FontWeight.w600),
                GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close, color: theme.textColor, size: 24))
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(height: 2, color: Colors.grey.withOpacity(.12)),
          Expanded(
              child: ListView.builder(
                  itemCount: 16,
                  padding: const EdgeInsets.only(top: 16),
                  itemBuilder: (_, index) {
                    return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                                child: SizedBox(
                              width: getWidth(300, context),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(width: getWidth(24, context)),
                                  Image.asset(
                                    "assets/icons/profile.png",
                                    height: 24,
                                    width: 24,
                                    color: theme.textColor,
                                  ),
                                  SizedBox(width: getWidth(12, context)),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: getWidth(280, context),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: MyText(
                                                    text: "Blessedcakes",
                                                    fontSize: 14,
                                                    maxlines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: theme.textColor),
                                              ),
                                              MyText(
                                                  text: "23m",
                                                  fontSize: 10,
                                                  maxlines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: theme.textColor),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                            height: getHeight(10.5, context)),
                                        MyText(
                                            text: "I love your content " * 100,
                                            fontSize: 14,
                                            maxlines: 3,
                                            overflow: TextOverflow.ellipsis,
                                            color: theme.textColor),
                                        SizedBox(
                                            height: getHeight(12, context)),
                                        MyText(
                                            text: "Reply",
                                            fontSize: 14,
                                            maxlines: 1,
                                            color: theme.textColor),
                                        SizedBox(
                                            height: getHeight(12, context)),
                                        Row(
                                          children: [
                                            Container(
                                                height: 1,
                                                width: 22,
                                                color: Colors.grey),
                                            SizedBox(
                                                width: getWidth(6, context)),
                                            MyText(
                                                text: "View 1 more reply",
                                                fontSize: 12,
                                                maxlines: 1,
                                                color: theme.textColor),
                                          ],
                                        ),
                                        SizedBox(
                                            height: getHeight(32, context)),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: getWidth(24, context)),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 24.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          "assets/heart.png",
                                          width: 16,
                                          height: 16,
                                          color: index % 2 == 0
                                              ? Colors.red
                                              : theme.textColor,
                                        ),
                                        SizedBox(height: getHeight(4, context)),
                                        MyText(
                                            text: formatKMBTNumber(4568),
                                            fontSize: 12,
                                            color: theme.textColor)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ))));
                  })),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                theme: theme,
                hintText: "send a message",
                width: controller.text.isEmpty ? null : getWidth(320, context),
                controller: controller,
                maxLines: 1,
                onChanged: (p0) {
                  setState(() {});
                },
              ),
              if (controller.text.isNotEmpty)
                SizedBox(width: getWidth(8, context)),
              if (controller.text.isNotEmpty)
                Image.asset("assets/share.png",
                    height: 24, width: 24, color: theme.enabledButtonColor)
            ],
          ),
          SizedBox(
              height: getHeight(16, context) +
                  (MediaQuery.of(context).viewInsets.bottom > 0
                      ? 0
                      : MediaQuery.of(context).viewPadding.bottom) +
                  MediaQuery.of(context).viewInsets.bottom)
        ],
      ),
    );
  }
}
