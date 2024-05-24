import 'package:d/widgets/customSearchBar.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PreferredSize(
          preferredSize: const Size(50.0, 30.0),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                height: 30.0,
                width: 30.0,
                child: Image.asset("images/logos/logo.png"),
              ),
              Expanded(child: CustomSearchBar(focus:true)),
            ],
          ),
        ),
      ),
    );
  }
}
