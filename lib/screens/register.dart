import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Register extends StatefulWidget {
  Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isValuePassword = false;
  bool isValuePolicy = false;
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
                          prefixIcon: Icon(Icons.email_outlined),
                          label: Text("Name"),
                          hintText: "Name",
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
                          prefixIcon: Icon(Icons.email_outlined),
                          label: Text("Phone Number"),
                          hintText: "Phone number address",
                          border: OutlineInputBorder(gapPadding: 1.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    SizedBox(
                      height: 45.0,
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isValuePassword,
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
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: isValuePassword,
                                onChanged: (value) {
                                  setState(() {
                                    isValuePassword = value!;
                                  });
                                },
                              ),
                              const Text("show password"),
                            ],
                          ),
                          RichText(
                            text: TextSpan(
                              text: "I have read the ",
                              style: const TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "privacy policy ",
                                  style: const TextStyle(color: Colors.blue),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print("privacy policy");
                                    },
                                ),
                                const TextSpan(
                                  text: "and ",
                                  style: TextStyle(color: Colors.black),
                                ),
                                TextSpan(
                                  text: "terms of use",
                                  style: const TextStyle(color: Colors.blue),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      print("terms of use");
                                    },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10.0),
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
                        "Create Account",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    RichText(
                      text: TextSpan(
                        text: "Already have an account. Please ",
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "sign in",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.go("/home/login");
                              },
                            style: const TextStyle(color: Colors.blue),
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
