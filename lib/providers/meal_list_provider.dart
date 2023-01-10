import 'package:flutter/material.dart';
import 'package:yga/models/meal_list.dart';

class MealListProvider with ChangeNotifier {
  MealListModel _meals = MealListModel(message: '', status: null, value: null);

  List<Yemeks>? get meal_list => _meals.value!.yemeks;

  List<Yemeks>? cartList = [];
  List<Yemeks>? ownedMeals = [];

  void clearCart() {
    cartList = [];
    notifyListeners();
  }

  void addToCart(Yemeks meal) {
    cartList!.add(meal);
    notifyListeners();
  }

  void removeFromCart(Yemeks meal) {
    cartList!.remove(meal);
    notifyListeners();
  }

  void removeFromOwned(Yemeks meal) {
    ownedMeals!.remove(meal);
    notifyListeners();
  }

  void setMeals(dynamic meals) {
    _meals = MealListModel.fromJson(meals);
  }
}
