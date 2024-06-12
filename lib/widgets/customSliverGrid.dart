import 'package:d/constants/constants.dart';
import 'package:d/models/product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomSliverGrid extends StatelessWidget {
  List<dynamic> products;

  CustomSliverGrid({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    const Key scrollKey = ValueKey<String>('bottom-sliver-lis');
    return SliverGrid(
      key: scrollKey,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300.0,
        mainAxisSpacing: 3.0,
        crossAxisSpacing: 3.0,
        childAspectRatio: 0.65,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          Product product = products[index];
          String price = commaSeparatedPrice("${product.price}");
          return GestureDetector(
            onTap:()=>context.go("/home/product/${product.id}",extra:product),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                      child: Stack(
                        children: [
                          Positioned.fill(
                            top: 0.0,
                            right: 0.0,
                            left: 0.0,
                            bottom: 0.0,
                            child: Image.network(
                              product.images![0],
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            right: 0.0,
                            child: GestureDetector(
                              onTap:()=>print("wishlist"),
                              child: Container(
                                padding: const EdgeInsets.only(
                                  top: 1.0,
                                  right: 1.0,
                                  left: 1.0,
                                  bottom: 1.0,
                                ),
                                decoration: const BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(5.0))),
                                child: const Icon(
                                  Icons.favorite_border,
                                  size: 22.0,
                                  color: Colors.blueGrey,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              decoration: const BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5.0),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "${product.averageRating}",
                                    style: const TextStyle(
                                      color: Colors.green,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.star_half,
                                    size: 14.0,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 3.0),
                    child: Text(
                      product.name!,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 3.0),
                    child: RichText(
                      text: TextSpan(
                        text: "UGX ",
                        style: const TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                        children: [
                          TextSpan(
                            text: price,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 3.0, bottom: 3.0),
                    padding: const EdgeInsets.only(left: 3.0, right: 8.0),
                    decoration: const BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.0),
                        topRight: Radius.elliptical(18.0, 18.0),
                        bottomLeft: Radius.circular(5.0),
                      ),
                    ),
                    child: Text(
                      product.freeShipping! ? "free delivery" : "express",
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        findChildIndexCallback: (Key key) {
          final valueKey = key as ValueKey;
          final index =
               products.indexWhere((product) => product == valueKey.value);
          if (index == -1) return null;
          return index;
        },
        childCount: 8, // automatic count increment
        // childCount: products.length, // automatic count increment
      ),
    );
  }
}
