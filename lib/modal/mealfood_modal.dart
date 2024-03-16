class MealFood {
  dynamic icon;
  String? mealName;
  String? language;
  bool? isEdit;
  List<ProductTypes>? calories;
  MealFood({this.icon, this.mealName, this.isEdit, this.calories});

  factory MealFood.fromJson(Map<String, dynamic> json) => MealFood(
        icon: json["icon"],
        isEdit: json["isEdit"],
        mealName: json["mealName"],
        calories: json["Calories"] == null
            ? []
            : List<ProductTypes>.from(json["Calories"]!.map((x) => ProductTypes.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "icon": icon,
        "isEdit": isEdit,
        "mealName": mealName,
      };
}

class ProductTypes {
  String? productName;
  int? mealCalories;

  ProductTypes({this.productName, this.mealCalories});

  factory ProductTypes.fromJson(Map<String, dynamic> json) => ProductTypes(
        productName: json["productName"],
        mealCalories: json["mealCalories"],
      );

  Map<String, dynamic> toJson() => {
        "productName": productName,
        "mealCalories": mealCalories,
      };
}
