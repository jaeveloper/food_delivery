import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:food_delivery/bloc/provider.dart';
import 'package:food_delivery/model/fooditem.dart';
import 'package:rxdart/rxdart.dart';

class CartListBloc extends BlocBase {
  CartListBloc();

  var _listController = BehaviorSubject<List<FoodItem>>.seeded([]);

  CartProvider provider = CartProvider();

//output
  Stream<List<FoodItem>> get listStream => _listController.stream;

//input
  Sink<List<FoodItem>> get listSink => _listController.sink;

//business logic
  addToList(FoodItem foodItem) {
    listSink.add(provider.addToList(foodItem));
  }

  removeFromList(FoodItem foodItem) {
    listSink.add(provider.removeFromList(foodItem));
  }

  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }
}
