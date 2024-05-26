import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isValue,
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
                    const SizedBox(height: 1.0),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisSize:MainAxisSize.min,
                        mainAxisAlignment:MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: isValue,
                            onChanged: (value) {
                              setState(() {
                                isValue = value!;
                              });
                              print(isValue);
                            },
                          ),
                          const Text("show password"),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print("presses");
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
                                context.go("/home/login/register");
                              },
                            style: const TextStyle(color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    RichText(
                      text: TextSpan(
                        text: "If you forgot the password. Please ",
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "reset here",
                            style: const TextStyle(color: Colors.blue),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.go("/home/login/reset");
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
