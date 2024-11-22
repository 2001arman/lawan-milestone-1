// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/utility/shared/widgets/text/text_border.dart';

import '../../constants/constants_ui.dart';

class TabbarWidget extends StatelessWidget {
  const TabbarWidget({
    super.key,
    required this.tabBarTitle,
    required this.tabActive,
    required this.onTap,
    required this.alignment,
    this.backgroundColor,
    this.activeColor,
    this.textActiveColor,
    this.textInActiveColor,
    this.tabBarIcon,
    this.selectedWidth,
    this.iconSize,
    this.listNumber,
  });

  final double? selectedWidth, iconSize;
  final List<int?>? listNumber;
  final List<String> tabBarTitle;
  final List<String?>? tabBarIcon;
  final RxString tabActive;
  final Rx<AlignmentGeometry> alignment;
  final Color? backgroundColor, activeColor, textActiveColor, textInActiveColor;
  final Function(String title) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor ?? kGreyColor,
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
                          width: selectedWidth ??
                              constraints.maxWidth / tabBarTitle.length,
                          decoration: BoxDecoration(
                            color: activeColor ?? kWhiteColor,
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
                  .asMap()
                  .entries
                  .map(
                    (title) => Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => onTap(title.value),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (tabBarIcon != null &&
                                        tabBarIcon?[title.key] != null)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 2),
                                        child: SvgPicture.asset(
                                          tabBarIcon![title.key]!,
                                          color: tabActive.value == title.value
                                              ? textActiveColor ??
                                                  kDarkgreyColor
                                              : textInActiveColor ??
                                                  kDarkgreyColor,
                                          width: iconSize,
                                          height: iconSize,
                                        ),
                                      ),
                                    Text(
                                      title.value,
                                      style: greyTextStyle.copyWith(
                                        color: tabActive.value == title.value
                                            ? textActiveColor ?? kBlackColor
                                            : textInActiveColor ??
                                                kDarkgreyColor,
                                        fontWeight:
                                            tabActive.value == title.value
                                                ? medium
                                                : reguler,
                                      ),
                                    ),
                                    if (listNumber != null &&
                                        listNumber?[title.key] != null)
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: TextBorder(
                                          textTitle: listNumber![title.key]!
                                              .toString(),
                                          paddingHorizontal: 6,
                                          paddingVertical: 0,
                                          borderColor: kWhiteColor,
                                          textColor: kDarkgreyColor,
                                        ),
                                      ),
                                  ],
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
