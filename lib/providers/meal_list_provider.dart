import 'package:flutter/material.dart';
import 'package:yga/models/meal_list.dart';

class MealListProvider with ChangeNotifier {
  MealListModel _meals = MealListModel(message: '', status: null, value: null);

  List<Yemeks>? get meal_list => _meals.value!.yemeks;

  void setMeals(dynamic meals) {
    _meals = MealListModel.fromJson(meals);
  }
}
