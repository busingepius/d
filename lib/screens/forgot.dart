import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Forgot extends StatelessWidget {
  Forgot({super.key});


  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Form(
                key: formKey,
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
                    const SizedBox(height: 8.0),
                    SizedBox(
                      height: 45.0,
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: false,
                        validator: (value) {
                          print(value);
                        },
                        textAlignVertical: TextAlignVertical.center,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          label: Text("New Password"),
                          hintText: "New Password",
                          border: OutlineInputBorder(gapPadding: 1.0),
                        ),
                      ),
                    ),
                    const SizedBox(height:8.0),
                    SizedBox(
                      height: 45.0,
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: false,
                        validator: (value) {
                          print(value);
                        },
                        textAlignVertical: TextAlignVertical.center,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          label: Text("Confirm Password"),
                          hintText: "Confirm Password",
                          border: OutlineInputBorder(gapPadding: 1.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 1.0),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print("reset");
                        }
                        FocusScope.of(context).unfocus();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(horizontal: 50.0)),
                      ),
                      child: const Text(
                        "Reset Password",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
