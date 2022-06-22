import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_bloc_beginner/events/food_event.dart';

import '../models/food.dart';

class FoodBloc extends Bloc<FoodEvent, List<Food>> {
  @override
  // TODO: implement initialState
  List<Food> get initialState => <Food>[];

  @override
  Stream<List<Food>?> mapEventToState(FoodEvent event) async* {
    // TODO: implement mapEventToState
    switch (event.eventType) {
      case EventType.add:
        List<Food> newState = List.from(state);
        if (event.eventType != null) {
          newState.add(event.food);
        }
        yield newState;
        break;
      //
      case EventType.delete:
        List<Food> newState = List.from(state);
        newState.removeAt(event.foodIndex!);
        yield null;
        break;

      default:
        throw Exception('Event not found $event');
    }
  }
}
