import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter_food_delivery_app/bloc/provider.dart';
import 'package:flutter_food_delivery_app/model/foodItem.dart';
import 'package:rxdart/rxdart.dart';

class CartListBloc extends BlocBase {
  CartListBloc();

  var _listController = BehaviorSubject<List<FoodItem>>.seeded([]);

  CartProvider provider = CartProvider();

  Stream<List<FoodItem>> get listStream => _listController.stream;

  Sink<List<FoodItem>> get listSink => _listController.sink;

  addToList(FoodItem foodItem) {
    listSink.add(provider.addToList(foodItem));
  }

  removeFromList(FoodItem foodItem) {
    listSink.add(provider.removeFromList(foodItem));
  }

  @override
  void dispose() {
    _listController?.close();
    super.dispose();
  }
}
