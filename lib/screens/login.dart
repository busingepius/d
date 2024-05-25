import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});

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
                    SizedBox(
                      height: 200.0,
                      child: Image.asset("images/logos/logo.png"),
                    ),
                    SizedBox(
                      height: 45.0,
                      child: TextFormField(
                        validator: (value) {
                          print(value);
                        },
                        textAlignVertical: TextAlignVertical.center,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          label: Text("Email"),
                          hintText: "Email address",
                          border: OutlineInputBorder(gapPadding: 1.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    SizedBox(
                      height: 45.0,
                      child: TextFormField(
                        validator: (value) {
                          print(value);
                        },
                        textAlignVertical: TextAlignVertical.center,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          label: Text("Password"),
                          hintText: "Password",
                          border: OutlineInputBorder(gapPadding: 1.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print("presses");

                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            const EdgeInsets.symmetric(horizontal: 50.0)),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    RichText(
                      text: TextSpan(
                        text: "Create an account. Please ",
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "register here",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                print("register here");
                              },
                            style:const TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    RichText(
                      text:  TextSpan(
                        text: "If you forgot the password. Please ",
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "reset here",
                            style:const TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()..onTap = (){
                              print("reset here");
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
      ),
    );
  }
}
