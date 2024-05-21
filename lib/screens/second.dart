import 'package:d/bloc/bloc.dart';
import 'package:d/widgets/widget.dart';
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
            BlocBuilder<AccountCubit, int>(
                builder: (BuildContext context, int state) {
              return Text("${context.read<AccountCubit>().state}");
            }),
            MultiBlocListener(
              listeners: [
                BlocListener<AccountCubit, int>(
                  listener: (BuildContext context, int state) {
                    showCustomDialog(context);
                    // showCustomAboutDialog(context);
                    // showCustomBottomSheet(context);
                  },
                ),
                BlocListener<CounterCubit, int>(
                  listener: (BuildContext context, int state) {
                    showCustomSnackBar(
                      context: context,
                      state: context.read<CounterCubit>().state,
                    );
                  },
                ),
              ],
              child: const Text("just listening"),
            ),
            ElevatedButton(
              onPressed: () => {
                context.read<CounterCubit>().increment(),
                context.read<AccountCubit>().add(const AccountIncrementEvent()),
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
