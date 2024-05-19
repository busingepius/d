import 'package:d/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Second extends StatelessWidget {
  static const routePath = "/second";

  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${context.read<AccountCubit>().state}"),
            ElevatedButton(
              onPressed: () => {
                context.read<CounterCubit>().increment(),
                showAboutDialog(
                  context: context,
                  barrierDismissible: false,
                  children: const [
                    Text("2222222222222"),
                    Text("1111111111"),
                  ],
                ),
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: const Text("Increase Counter"),
            ),
          ],
        ),
      ),
    );
  }
}
