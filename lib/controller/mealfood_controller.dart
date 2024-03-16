import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskproject/modal/mealfood_modal.dart';

class MealFoodController extends GetxController {
  bool isEdit = false;
  List<MealFood> languagesList = [
    MealFood(icon: Icon(Icons.file_copy), mealName: "Milk", isEdit: false, calories: [
      ProductTypes(productName: "Almond milk", mealCalories: 12),
      ProductTypes(productName: "yogurt", mealCalories: 16),
      ProductTypes(productName: "cheese", mealCalories: 189)
    ]),
    MealFood(icon: Icon(Icons.sunny), mealName: "Fruits", calories: [ProductTypes(productName: "Mango", mealCalories: 18)]),
    MealFood(icon: Icon(Icons.shield_moon), mealName: "Junk foods", calories: [
      ProductTypes(productName: "Burger", mealCalories: 30),
      ProductTypes(productName: "Pizza", mealCalories: 50)
    ]),

    MealFood(
      icon: Icon(Icons.light_rounded),
      mealName: "Healthy foods",
    ),
    MealFood(icon: Icon(Icons.foggy), mealName: "Meat", calories: [
      ProductTypes(productName: "Beef & Veal", mealCalories: 85),
      ProductTypes(productName: "Pork", mealCalories: 100),
      ProductTypes(productName: "Sushi", mealCalories: 60)
    ]),
    MealFood(
      icon: Icon(Icons.foggy),
      mealName: "Rice",
    )
    //Languages(flag: MyImgs.flagIcon, language: "English", lanCode: Locale('en')),
  ];
}
