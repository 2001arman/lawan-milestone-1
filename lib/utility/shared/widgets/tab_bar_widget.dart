import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/constants_ui.dart';

class TabbarWidget extends StatelessWidget {
  const TabbarWidget(
      {super.key,
      required this.tabBarTitle,
      required this.tabActive,
      required this.onTap,
      required this.alignment});
  final List<String> tabBarTitle;
  final RxString tabActive;
  final Rx<AlignmentGeometry> alignment;
  final Function(String title) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: kGreyColor,
        border: Border.all(
          width: 1,
          color: Colors.transparent,
        ),
      ),
      child: Stack(
        children: [
          Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: AnimatedAlign(
                    alignment: alignment.value,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return Container(
                          width: constraints.maxWidth / 3,
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: const Text(
                            '',
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => Row(
              children: tabBarTitle
                  .map(
                    (title) => Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => onTap(title),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Text(
                                  title.tr,
                                  style: greyTextStyle.copyWith(
                                    color: tabActive.value == title
                                        ? kBlackColor
                                        : kDarkgreyColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}