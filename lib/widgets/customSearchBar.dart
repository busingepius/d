import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomSearchBar extends StatelessWidget {
  bool? focus;

  CustomSearchBar({
    this.focus,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
      height: 40.0,
      child: SearchBar(
        elevation: MaterialStateProperty.all<double>(10.0),
        shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        surfaceTintColor: MaterialStateProperty.all<Color>(Colors.grey),
        overlayColor: MaterialStateProperty.all<Color>(Colors.blue),
        textInputAction: TextInputAction.search,
        autoFocus: focus ?? false,
        hintText: "Search here for everything",
        leading: const Icon(Icons.search),
        onTap: () => context.go("/search"),
        hintStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(
            color: Colors.grey,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}
