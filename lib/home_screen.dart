import 'package:flutter/material.dart';

import 'auth/auth_screen.dart';
import 'counter/counter_screnn.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MultiBloc'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CounterScreen()),
              ),
              child: const Text('Go to Counter Screen'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AuthScreen()),
              ),
              child: const Text('Go to Auth Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
