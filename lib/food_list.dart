import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/food_bloc.dart';
import 'events/food_event.dart';
import 'models/food.dart';

class FoodList extends StatelessWidget {
  const FoodList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<FoodBloc, List<Food>>(
            buildWhen: (List<Food> previous, List<Food> current) {
          // lebih kecil
          if (previous.length < current.length) {
            return true;
          }
          return false;
        }, listenWhen: (List<Food> previous, List<Food> current) {
          // lebih besar
          if (previous.length > current.length) {
            return true;
          }
          return false;
        }, builder: (context, foodlist) {
          return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              itemCount: foodlist.length,
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                  title: Text(foodlist[index].name.toString()),
                  onTap: () => BlocProvider.of<FoodBloc>(context).add(
                    FoodEvent.delete(index),
                  ),
                ));
              });
        }, listener: (BuildContext context, foodlist) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("added")));
        }));
  }
}
