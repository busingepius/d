import 'package:d/widgets/customSearchBar.dart';
import 'package:d/widgets/widget.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final bannersAndProducts = GoRouterState.of(context).extra! as Map;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: SizedBox(
              height: 30.0,
              width: 30.0,
              child: Image.asset("images/logos/logo.png"),
            ),
            pinned: true,
            snap: false,
            backgroundColor: Colors.white,
            floating: false,
            elevation: 0.0,
            actions: [
              const Text("Login"),
              Container(
                margin: const EdgeInsets.only(right: 15.0, left: 5.0),
                child: InkWell(
                  onTap: () => print("notifications"),
                  child: const Badge(
                    label: Text("12"),
                    child: Icon(Icons.notifications),
                  ),
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size(50.0, 30.0),
              child: CustomSearchBar(),
            ),
          ),
          const SliverToBoxAdapter(
            child: CategoryCard(),
          ),
          SliverToBoxAdapter(
            child: CustomPageView(banners: bannersAndProducts["banners"]),
          ),
          SliverPadding(
            padding:const EdgeInsets.symmetric(horizontal: 5.0),
            sliver: CustomSliverGrid(products: bannersAndProducts["products"]),
          ),
        ],
      ),
    );
  }
}
