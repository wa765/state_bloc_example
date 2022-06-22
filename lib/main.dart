import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_bloc_beginner/bloc/food_bloc.dart';
import 'package:state_bloc_beginner/bloc/food_bloc_delegate.dart';
import 'package:state_bloc_beginner/food_form.dart';

void main() {
  BlocSupervisor.delegate = FoodBlocDelegate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FoodBloc>(
      create: (context) => FoodBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coding With Me',
        theme: ThemeData(
            primarySwatch: Colors.blue, secondaryHeaderColor: Colors.red),
        home: FoodForm(),
      ),
    );
  }
}
