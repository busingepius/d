import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Verify extends StatelessWidget {
  bool isValue = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap:()=> context.go("/home"),
                    child: SizedBox(
                      height: 200.0,
                      child: Image.asset("images/logos/logo.png"),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  RichText(
                    text: TextSpan(
                      text: "Your account has been verified. Proceed to ",
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: "sign in",
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.go("/home/login");
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
