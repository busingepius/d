import 'package:d/bloc/data/data.dart';
import 'package:d/bloc/data/event.dart';
import 'package:d/screens/screens.dart';
import 'package:d/widgets/customSearchBar.dart';
import 'package:d/widgets/widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DataBloc>(context).add(const SplashEvent());
    FocusScope.of(context).hasFocus ? FocusScope.of(context).unfocus() : null;
    return Scaffold(
      body: BlocBuilder<DataBloc, Map>(
        builder: (BuildContext context, Map<dynamic, dynamic> state) {
          Map<dynamic, dynamic> bannersAndProducts = state;
          return bannersAndProducts.length < 2
              ? const SplashScreen()
              : CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      leading: SizedBox(
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
                        GestureDetector(
                          onTap: () => context.go("/home/login"),
                          child: const Text("Login"),
                        ),
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
                        child: CustomSearchBar(focus: false),
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: CategoryCard(),
                    ),
                    SliverToBoxAdapter(
                      child: CustomPageView(
                          banners: bannersAndProducts["banners"]!),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      sliver: CustomSliverGrid(
                          products: bannersAndProducts["products"]!),
                    ),
                  ],
                );
        },
      ),
    );
  }
}
