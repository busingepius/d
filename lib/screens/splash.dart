import 'package:d/bloc/data/data.dart';
import 'package:d/bloc/data/event.dart';
import 'package:d/widgets/snackBarAndDialog.dart';
import 'package:d/widgets/snackBarAndDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DataBloc>(context).add(const SplashEvent());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocListener<DataBloc, Map>(
              listener: (BuildContext context, state) {
                if (state.keys.first == "message") {
                  showCustomSnackBar(context:context,message:state["message"]);
                } else {
                  context.go("/home");
                }
              },
              child: const Spacer(),
            ),
            Image.asset(
              "images/logos/logo.png",
              height: 200.0,
              width: 200.0,
            ),
            const Spacer(),
            const Text("Setting you up..."),
          ],
        ),
      ),
    );
  }
}
