import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_widget.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';
import 'package:lawan/utility/shared/widgets/container/select_friend_item.dart';
import 'package:lawan/utility/shared/widgets/custom_text_form_fields.dart';
import 'package:lawan/utility/shared/widgets/text/text_border.dart';
import 'package:lawan/utility/shared/widgets/text/text_pill_widget.dart';

import '../../../../utility/shared/constants/constants_ui.dart';
import '../controller/player_main_logic.dart';
import '../controller/player_main_state.dart';

class PlayerAddPlayerBottomSheet {
  final PlayerMainState state;
  final PlayerMainLogic logic;

  PlayerAddPlayerBottomSheet({required this.state, required this.logic});

  void addPlayerBottomSheet({required}) {
    Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          height: Get.height * 0.865,
          width: Get.width,
        ).blurred(
          blur: 7,
          blurColor: Colors.white,
          colorOpacity: 0,
          borderRadius: BorderRadius.circular(32),
          overlay: Container(
            padding: EdgeInsets.all(defaultMargin),
            decoration: BoxDecoration(
              color: kModalColor,
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, -0.5),
                  blurStyle: BlurStyle.inner,
                  spreadRadius: 0,
                  blurRadius: 0,
                  color: kBlackColor.withOpacity(0.1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // title and close button
                Row(
                  children: [
                    Icon(
                      Icons.person_add_alt,
                      color: kDarkgreyColor,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Invite Friend(s)',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: medium),
                    ),
                    const Spacer(),
                    CircleButtonTransparentWidget(
                      onTap: () {},
                      widget: Icon(
                        Icons.close,
                        size: 20,
                        color: kDarkgreyColor,
                      ),
                      borderColor: kGreyColor,
                      size: 40,
                    ),
                  ],
                ),
                SizedBox(height: defaultMargin),

                // text input search
                CustomTextFormField(
                  hintText: 'Search or add name/email',
                  controller: TextEditingController(),
                  prefix: Icon(
                    Icons.search,
                    color: kDarkgreyColor,
                  ),
                ),

                // info container
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(defaultMargin),
                  margin: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: kGreyColor, width: 1),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: kWhiteColor,
                        weight: 1,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Complete your booking to send an invite to the session and start playing together!',
                          style: darkGreyTextStyle.copyWith(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Invitation will expire in',
                    style: blackTextStyle.copyWith(fontSize: 12),
                    children: [
                      TextSpan(
                        text: ' 2 days 2 hours 6 mins 3 sec ',
                        style: blackTextStyle.copyWith(fontWeight: bold),
                      ),
                    ],
                  ),
                ),

                // friends
                SizedBox(height: defaultMargin),
                Expanded(
                  child: SingleChildScrollView(
                    child: Obx(
                      () => Visibility(
                        visible: state.listFriends.isNotEmpty,
                        replacement: SizedBox(
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.groups_2_outlined,
                                size: 30,
                                color: kWhiteColor,
                              ),
                              Text(
                                'Search Players',
                                style: blackTextStyle.copyWith(
                                    fontSize: 16, fontWeight: medium),
                              ),
                              Text(
                                'Search for player to team up and play together',
                                style: blackTextStyle.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        child: Column(
                          children: state.listFriends
                              .map(
                                (data) => Container(
                                  width: double.infinity,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                          color: kGreyColor, width: 1),
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Image.asset(data.asset, width: 48),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              data.name,
                                              style: blackTextStyle.copyWith(
                                                fontWeight: medium,
                                                fontSize: 12,
                                              ),
                                            ),
                                            const SizedBox(height: 6),
                                            TextBorder(
                                              textTitle: 'Novice',
                                              backgroundColor: kWhiteColor,
                                              fontSize: 10,
                                            )
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Prefer as',
                                            style: darkGreyTextStyle.copyWith(
                                                fontSize: 10),
                                          ),
                                          const SizedBox(width: 8),
                                          TextPillWidget(
                                            verticalPadding: 2,
                                            backgroundColor: kWhiteColor,
                                            prefix: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 2),
                                              child: Icon(
                                                Icons.person_2_outlined,
                                                size: 18,
                                                color: kMidgreyColor,
                                              ),
                                            ),
                                            title: data.position,
                                            titleColor: kBlackColor,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 12),
                                      CircleButtonTransparentWidget(
                                        onTap: () {
                                          state.selectedFriends.add(data);
                                          state.listFriends.remove(data);
                                        },
                                        widget: Icon(
                                          Icons.add,
                                          size: 20,
                                          color: kDarkgreyColor,
                                        ),
                                        borderColor: kGreyColor,
                                        size: 40,
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),

                // recent people
                Obx(
                  () => state.selectedFriends.isNotEmpty
                      ? Column(
                          children: [
                            SizedBox(height: defaultMargin),
                            Text(
                              'Recent people',
                              style: darkGreyTextStyle.copyWith(fontSize: 12),
                            ),
                            const SizedBox(height: 8),
                          ],
                        )
                      : const SizedBox(),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () => Row(
                      children: state.selectedFriends
                          .map(
                            (data) => SelectFriendItem(
                              name: data.name,
                              asset: data.asset,
                              suffixWidget: CircleButtonWidget(
                                onTap: () {
                                  state.listFriends.add(data);
                                  state.selectedFriends.remove(data);
                                },
                                isActive: true,
                                widget: Icon(
                                  Icons.done,
                                  size: 20,
                                  color: kWhiteColor,
                                ),
                                size: 36,
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),

                // button
                SizedBox(height: defaultMargin),
                Row(
                  children: [
                    CircleButtonTransparentWidget(
                      onTap: () {},
                      widget: Icon(
                        Icons.arrow_back_ios_sharp,
                        size: 18,
                        color: kDarkgreyColor,
                      ),
                    ),
                    SizedBox(width: defaultMargin),
                    CustomButton(
                      isBlack: true,
                      onTap: Get.back,
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Add',
                            style: whiteTextStyle.copyWith(fontWeight: medium),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: kWhiteColor,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: defaultMargin),
                    Obx(
                      () => Row(
                        children: [
                          ...state.selectedFriends.take(3).map(
                                (friend) => Align(
                                  widthFactor: .55,
                                  child: SizedBox(
                                    width: 48,
                                    height: 48,
                                    child: CircleAvatar(
                                      backgroundColor: kGreyColor,
                                      radius: 48,
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            AssetImage(friend.asset),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          if (state.selectedFriends.length > 3)
                            Align(
                              widthFactor: .55,
                              child: SizedBox(
                                width: 48,
                                height: 48,
                                child: CircleAvatar(
                                  backgroundColor: kGreyColor,
                                  radius: 48,
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.black,
                                    child: Text(
                                      '+${state.listFriends.length - 3}',
                                      style: whiteTextStyle.copyWith(
                                        fontSize: 16,
                                        fontWeight: medium,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      isScrollControlled: true,
      enableDrag: true,
    );
  }
}