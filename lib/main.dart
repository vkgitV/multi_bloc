import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multibloc/auth/auth_bloc.dart';
import 'package:flutter_multibloc/counter/counter_bloc.dart';
import 'package:flutter_multibloc/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc(),),
        BlocProvider<CounterBloc>(create: (context) => CounterBloc(),)
      ],
      child: const MaterialApp(home: HomeScreen()),
    );
  }
}