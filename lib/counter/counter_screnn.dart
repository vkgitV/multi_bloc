
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multibloc/counter/counter_event.dart';

import 'counter_bloc.dart';
import 'counter_state.dart';
class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocConsumer<CounterBloc, CounterState>(
        listenWhen: (previous, current) {
          print("listen when ${current.isFive}");
          return current.isFive;
        },
        listener: (context, state) {
          // if (state.isFive) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Count reached 5!')),
            );
          // }
        },
        buildWhen: (previous, current) {
          return current.count <=5;
        },
        builder: (context, state) {
          return Center(
            child: Text(
              'Counter: ${state.count}',
              style: const TextStyle(fontSize: 24),
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(IncrementEvent());
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(DecrementEvent()),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
