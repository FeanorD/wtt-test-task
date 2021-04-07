import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wtt_test_task/blocs/auth/auth_bloc.dart';
import 'package:wtt_test_task/repositories/auth/auth_repository.dart';
import 'package:wtt_test_task/repositories/auth/fake_auth_repository.dart';
import 'package:wtt_test_task/screens/auth_screen.dart';
import 'package:wtt_test_task/screens/home_screen.dart';

void main() {
  runApp(
    RepositoryProvider<AuthRepository>(
      create: (_) => FakeAuthRepository(),
      child: BlocProvider<AuthBloc>(
        create: (context) {
          final authRepository = RepositoryProvider.of<AuthRepository>(context);
          return AuthBloc(authRepository: authRepository);
        },
        child: MyApp(),
      ),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'WTT Solutions test task',
      theme: ThemeData(
        primaryColor: Color(0xFFFA1BBF),
        textTheme: GoogleFonts.montserratTextTheme(textTheme.copyWith(
          button: TextStyle(
            fontSize: 18,
          ),
          bodyText2: TextStyle(
            fontSize: 12,
          ),
        )),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          labelStyle: TextStyle(
            color: Color(0xFFB5B5B5),
            fontSize: 18,
          ),
          filled: true,
          fillColor: Color(0xFFEBEBEB),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (_, state) {
          if (state.status == AuthStatus.authenticated) {
            return HomeScreen();
          }
          return AuthScreen();
        },
      ),
    );
  }
}