import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtt_test_task/blocs/auth/auth_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Hello ${state.user.email}!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30
                      ),
                    ),
                    SizedBox(height: 20,),
                    ElevatedButton(
                      child: Text('Log out'),
                      onPressed: () => context.read<AuthBloc>()
                          .add(AuthUserSignedOut()),
                    ),
                  ],
                );
              },
            )
          ),
        ),
      ),
    );
  }
}
