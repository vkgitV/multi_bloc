
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auth')),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('User Authenticated')),
            );
          } else if (state is Unauthenticated) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('User Logged Out')),
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => context.read<AuthBloc>().add(LoginEvent()),
                child: const Text('Login'),
              ),
              ElevatedButton(
                onPressed: () => context.read<AuthBloc>().add(LogoutEvent()),
                child: const Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
