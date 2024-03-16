import 'package:flutter/material.dart';
import 'package:animated_styled_widget/animated_styled_widget.dart';
import 'package:get/get.dart';
import 'package:taskproject/modal/mealfood_modal.dart';
import 'package:taskproject/res/colors/app_color.dart';
import 'package:taskproject/res/constants.dart';
import 'package:taskproject/res/size_config/size_config.dart';

import '../controller/mealfood_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  MealFoodController mealFoodController = Get.put(MealFoodController());
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: AppColor.BackColorContainer,
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: AppColor.BackColorContainer,
        title: Text(
          "Meals",
          style: TextStyles.textStyle18,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              children: [
                Icon(
                  Icons.favorite_border,
                  size: 18,
                ),
                SizedBox(
                  width: getWidth(10),
                ),
                Icon(Icons.more_horiz),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: getHeight(20)),
          child: GetBuilder<MealFoodController>(builder: (mealFoodController) {
            return ListView.builder(
                itemCount: mealFoodController.languagesList.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColor.white,
                    ),
                    margin: EdgeInsets.only(left: getWidth(8), right: getWidth(8), top: getHeight(5)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      color: AppColor.BackColorContainer,
                                    ),
                                    margin: EdgeInsets.only(
                                      //top: getHeight(8),
                                      // bottom: getHeight(8),
                                      left: getWidth(10),
                                    ),
                                    width: getWidth(60),
                                    height: getHeight(60),
                                    child: mealFoodController.languagesList[index].icon,
                                  ),
                                  SizedBox(
                                    width: getWidth(10),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${mealFoodController.languagesList[index].mealName}",
                                        style: TextStyles.textStyle18,
                                      ),
                                      SizedBox(
                                        height: getHeight(5),
                                      ),
                                      mealFoodController.languagesList[index].calories?.length == null
                                          ? Container(
                                              margin: EdgeInsets.only(bottom: getHeight(10)),
                                              padding: EdgeInsets.symmetric(horizontal: getWidth(10)),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                                color: AppColor.textBackColor,
                                              ),
                                              child: Text(
                                                "No Product",
                                                style: TextStyles.textColorWhite,
                                              ),
                                            )
                                          : mealFoodController.languagesList[index].isEdit == true
                                              ? InkWell(
                                                  onTap: () {
                                                    // mealFoodController.languagesList[index].isEdit = true;
                                                    mealFoodController.update();
                                                    //  mealFoodController.languagesList.add(MealFood(isEdit: true));
                                                  },
                                                  child: Container(
                                                      alignment: Alignment.center,
                                                      height: getHeight(20),
                                                      width: getWidth(50),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(20),
                                                        border: Border.all(color: AppColor.greenColor),
                                                      ),
                                                      child: Text(
                                                        "Save",
                                                        style: TextStyles.textColorGreen,
                                                      )),
                                                )
                                              : InkWell(
                                                  onTap: () {
                                                    mealFoodController.languagesList[index].isEdit = true;
                                                    mealFoodController.update();
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: getHeight(20),
                                                    width: getWidth(50),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20),
                                                      border: Border.all(color: AppColor.blackColor),
                                                    ),
                                                    child: Text(
                                                      "edit",
                                                      style: TextStyles.textStyle12,
                                                    ),
                                                  ),
                                                ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (mealFoodController.languagesList[index].calories == null) {
                                  mealFoodController.languagesList[index].calories = [
                                    ProductTypes(mealCalories: 24, productName: "this is product")
                                  ];
                                } else {
                                  mealFoodController.languagesList[index].calories
                                      ?.add(ProductTypes(productName: "This is product", mealCalories: 24));
                                }
                                mealFoodController.update();
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 25),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(2),
                                      topRight: Radius.circular(18),
                                      bottomLeft: Radius.circular(18),
                                      bottomRight: Radius.circular(2)),
                                  color: AppColor.blackColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColor.BackColorContainer,
                                      spreadRadius: 4.0,
                                      //    blurRadius: 4,
                                      offset: Offset(0, 0), // Adjust the offset to control the shadow direction
                                    ),
                                  ],
                                ),
                                height: getHeight(80),
                                width: getWidth(60),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        mealFoodController.languagesList[index].calories?.length == null
                            ? SizedBox()
                            : Container(
                                margin: EdgeInsets.only(left: getWidth(8), right: getWidth(8), bottom: getHeight(8)),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                                  color: AppColor.BackColorContainer,
                                ),
                                child: ListView.builder(
                                    itemCount: mealFoodController.languagesList[index].calories!.length + 1,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (BuildContext context, int indexes) {
                                      int totalCalories = 0;
                                      mealFoodController.languagesList[index].calories?.forEach((element) {
                                        totalCalories += element.mealCalories ?? 0;
                                      });

                                      if (mealFoodController.languagesList[index].calories!.length == indexes) {
                                        return Container(
                                          padding: EdgeInsets.only(
                                              left: getWidth(10), right: getWidth(30), bottom: getHeight(10)),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Total",
                                                style: TextStyles.textColorGreen14,
                                              ),
                                              Text(
                                                "${totalCalories} Cals",
                                                style: TextStyles.textColorGreen14,
                                              )
                                            ],
                                          ),
                                        );
                                      } else {
                                        return Container(
                                          padding: EdgeInsets.all(8),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "${mealFoodController.languagesList[index].calories?[indexes].productName}",
                                                    style: TextStyles.textStyle12,
                                                  ),
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "${mealFoodController.languagesList[index].calories?[indexes].mealCalories} Cals",
                                                          style: TextStyles.textStyle12,
                                                        ),
                                                        SizedBox(
                                                          width: getWidth(10),
                                                        ),
                                                        mealFoodController.languagesList[index].isEdit == true
                                                            ? InkWell(
                                                                onTap: () {
                                                                  mealFoodController.languagesList[index].calories
                                                                      ?.removeAt(indexes);
                                                                  mealFoodController.update();
                                                                },
                                                                child: Container(
                                                                    height: getHeight(20),
                                                                    width: getWidth(20),
                                                                    decoration: BoxDecoration(
                                                                        shape: BoxShape.circle,
                                                                        color: mealFoodController
                                                                                    .languagesList[index].isEdit ==
                                                                                true
                                                                            ? AppColor.redColor
                                                                            : Colors.black),
                                                                    child: Icon(
                                                                      Icons.clear,
                                                                      color: AppColor.white,
                                                                      size: 13,
                                                                    )),
                                                              )
                                                            : Container(
                                                                height: getHeight(20),
                                                                width: getWidth(20),
                                                                decoration: BoxDecoration(
                                                                    shape: BoxShape.circle,
                                                                    color: mealFoodController
                                                                                .languagesList[index].isEdit ==
                                                                            true
                                                                        ? AppColor.redColor
                                                                        : AppColor.blackColor),
                                                                child: Icon(
                                                                  Icons.arrow_forward_sharp,
                                                                  color: AppColor.white,
                                                                  size: 13,
                                                                ),
                                                              )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Divider(
                                                color: AppColor.white,
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    }),
                              ),
                      ],
                    ),
                  );
                });
          }),
        ),
      ),
    );
  }
}
