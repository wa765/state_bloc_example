import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_bloc_beginner/events/food_event.dart';
import 'package:state_bloc_beginner/food_list.dart';
import 'package:state_bloc_beginner/food_list_screen.dart';
import 'package:state_bloc_beginner/models/food.dart';

import 'bloc/food_bloc.dart';

class FoodForm extends StatefulWidget {
  const FoodForm({Key? key}) : super(key: key);

  @override
  State<FoodForm> createState() => _FoodFormState();
}

class _FoodFormState extends State<FoodForm> {
  String? _foodname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coding with me"),
      ),
      body: Container(
        padding: const EdgeInsets.all(36),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Bloc Tutorial",
                style: TextStyle(fontSize: 42),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Food'),
                style: TextStyle(fontSize: 22),
                onChanged: (text) {
                  setState(() {
                    _foodname = text;
                  });
                },
              ),
              FoodList(),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'button1',
            child: const Icon(Icons.save),
            onPressed: () {
              BlocProvider.of<FoodBloc>(context)
                  .add(FoodEvent.add(Food(_foodname.toString())));
            },
          ),
          const SizedBox(
            height: 16,
          ),
          FloatingActionButton(
            heroTag: 'button2',
            child: const Icon(Icons.navigate_next),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => FoodListScreen())),
          ),
        ],
      ),
    );
  }
}
