import 'package:d/bloc/data/data.dart';
import 'package:d/bloc/data/event.dart';
import 'package:d/widgets/snackBarAndDialog.dart';
import 'package:d/widgets/snackBarAndDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Map<String, List<dynamic>> productsAndbanners;

  @override
  void initState() {
    BlocProvider.of<DataBloc>(context).add(const SplashEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds:10),()=>context.go("/home"));
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
            const Text("Powered by Gegabox"),
          ],
        ),
      ),
    );
  }
}
