import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lawan/utility/shared/widgets/buttons/circle_button_transparent_widget.dart';
import 'package:lawan/utility/shared/widgets/buttons/custom_button.dart';
import 'package:lawan/utility/shared/widgets/custom_text_form_fields.dart';
import 'package:lawan/utility/shared/widgets/range_slider_widget.dart';

import '../shared/constants/constants_ui.dart';
import '../shared/widgets/selected_container_widget.dart';

class DialogFilter {
  static Widget selectableItem({
    required String title,
    required List<String> listData,
    required RxString selectedData,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, left: 16),
      child: Obx(
        () => Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                title,
                style: darkGreyTextStyle,
              ),
            ),
            Expanded(
              flex: 5,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: listData
                      .map(
                        (data) => SelectedContainerWidget(
                          title: data,
                          isSelected: data == selectedData.value,
                          onTap: () => selectedData.value = data,
                          isTransparent: true,
                          borderColor: kGreyColor,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> showFilterDialog() {
    List<String> statesData = [
      'All',
      'Johor',
      'Kedah',
      'Kelantan',
      'Melaka',
      'Negeri Sembilan',
    ];
    var selectedState = 'All'.obs;
    List<String> availableData = [
      'Weekend',
      'Weekdays',
    ];
    var selectedAvailable = 'Weekend'.obs;

    List<String> flooringData = [
      'All',
      'Grass',
      'Turf',
      'Cement',
    ];
    var selectedFlooring = 'Grass'.obs;

    List<String> genderData = [
      'All',
      'Male',
      'Female',
    ];
    var selectedGender = 'Male'.obs;

    List<String> arenaData = [
      'All',
      'Outdoor',
      'Indoor',
    ];
    var selectedArena = 'Outdoor'.obs;
    return Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
          width: Get.width * .8,
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              // month text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomTextFormField(
                  hintText: 'yoo',
                  controller: TextEditingController(text: 'All month'),
                  borderColor: kGreyColor,
                  suffix: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultMargin,
                      vertical: 12,
                    ),
                    child: Image.asset(
                      'assets/icons/arrow_up_down.png',
                      width: 20,
                      height: 20,
                      color: kBlackColor,
                    ),
                  ),
                ),
              ),

              // range slider
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: RangeSliderWidget(
                  dataText: 'km',
                  title: 'Range',
                  rangeValues: const RangeValues(10, 70),
                ),
              ),
              SizedBox(height: defaultMargin),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: RangeSliderWidget(
                  dataText: ' years',
                  title: 'Age',
                  rangeValues: const RangeValues(20, 30),
                  maxRange: 40,
                  minRange: 15,
                ),
              ),

              // states
              const SizedBox(height: 8),
              DialogFilter.selectableItem(
                title: 'States',
                listData: statesData,
                selectedData: selectedState,
              ),
              DialogFilter.selectableItem(
                title: 'Availability',
                listData: availableData,
                selectedData: selectedAvailable,
              ),
              DialogFilter.selectableItem(
                title: 'Flooring',
                listData: flooringData,
                selectedData: selectedFlooring,
              ),
              DialogFilter.selectableItem(
                title: 'Gender',
                listData: genderData,
                selectedData: selectedGender,
              ),
              DialogFilter.selectableItem(
                title: 'Arena Type',
                listData: arenaData,
                selectedData: selectedArena,
              ),

              SizedBox(height: defaultMargin),
              Container(
                padding: EdgeInsets.all(defaultMargin),
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: Row(
                  children: [
                    CircleButtonTransparentWidget(
                      size: 48,
                      onTap: () {},
                      borderColor: kGreyColor,
                      widget: SvgPicture.asset('assets/icons/refresh.svg'),
                    ),
                    SizedBox(width: defaultMargin),
                    CustomButton(
                      isBlack: false,
                      onTap: Get.back,
                      title: 'Cancel',
                      borderColor: kGreyColor,
                    ),
                    SizedBox(width: defaultMargin),
                    CustomButton(
                      isBlack: true,
                      onTap: Get.back,
                      title: 'Apply',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}