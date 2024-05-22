import 'package:d/bloc/count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // control the expansion to be in the given space only
            children: [
              BlocBuilder<CounterCubit,int>(
                builder: (context, state) =>
                    Text("${BlocProvider.of<CounterCubit>(context).state}"),
              ),
              ElevatedButton(
                onPressed: () => context.go("/second"),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color?>(Colors.red),
                ),
                child: const Text("Second Screen"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
