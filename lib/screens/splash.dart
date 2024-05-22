import 'package:d/bloc/data/data.dart';
import 'package:d/bloc/data/event.dart';
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
              // listenWhen: (previous, current) {
              //   return previous==current;
              // },
              listener: (BuildContext context, state) {
                print(state);
                context.go("/home");
              },
            child: const Spacer(),
            ),
            Image.asset(
              "images/logos/logo.png",
              height: 200.0,
              width: 200.0,
            ),
            // const Spacer(),
            const CircularProgressIndicator(
              color: Colors.black12,
            ),
            const Spacer(),
            const Text("Powered by Gegabox"),
          ],
        ),
      ),
    );
  }
}
