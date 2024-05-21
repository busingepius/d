import 'bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants/constants.dart';
import 'screens/screens.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
        BlocProvider<AccountCubit>(create: (context) => AccountCubit()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      initialRoute: "/",
      theme: theme,
      onGenerateRoute: (settings) {
        if (settings.name == Home.routePath) {
          return MaterialPageRoute(
              builder: (BuildContext context) => const Home());
        }
        if (settings.name == Second.routePath) {
          return MaterialPageRoute(
              builder: (BuildContext context) => const Second());
        }
      },
    );
  }
}
