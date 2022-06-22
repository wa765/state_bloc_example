import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_bloc_beginner/bloc/food_bloc.dart';
import 'package:state_bloc_beginner/events/food_event.dart';
import 'package:state_bloc_beginner/food_list.dart';

import 'models/food.dart';

class FoodListScreen extends StatelessWidget {
  const FoodListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocConsumer<FoodBloc, List<Food>>(builder: (context, foodList) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: const EdgeInsets.all(16),
          itemCount: foodList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(
                  foodList[index].name.toString(),
                ),
                onTap: () => BlocProvider.of<FoodBloc>(context)
                    .add(FoodEvent.delete(index)),
              ),
            );
          },
        );
      }, listener: (BuildContext context, foodList) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("added")));
      }),
    );
  }
}
