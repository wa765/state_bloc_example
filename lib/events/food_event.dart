import '../models/food.dart';

enum EventType { add, delete }

class FoodEvent {
  late Food food;
  int? foodIndex;
  late EventType eventType;

  // Constructor
  //
  FoodEvent();
  //
  FoodEvent.add(Food food) {
    eventType = EventType.add;
    this.food = food;
  }

  //
  FoodEvent.delete(int index) {
    eventType = EventType.delete;
    foodIndex = index;
  }
}
