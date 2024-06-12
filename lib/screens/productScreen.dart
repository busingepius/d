import 'package:d/models/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductScreen extends StatelessWidget {
  final String id;
  final Product? product;

  const ProductScreen({super.key, required this.id, this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 40.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              child: const Text("Add to Cart"),
              onPressed: () {
                print("Add to Cart");
              },
            ),
            const VerticalDivider(),
            TextButton(
              onPressed: () {
                print("Buy now");
              },
              child: const Text("Buy Now"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
          title: TextButton(
            child: const Text("Gegabox"),
            onPressed: () {
              context.go("/home");
            },
          ),
          actions: [
            IconButton(
                icon: const Icon(Icons.share), onPressed: () => print("share")),
            IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () => print("shopping_cart")),
          ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: PageView.builder(
                itemCount: product!.images!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    product!.images![index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => print("star"),
                    icon: const Icon(Icons.star_border),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => print("subtract"),
                        icon: const Icon(Icons.remove_circle_outline),
                      ),
                      Text("1"),
                      IconButton(
                        onPressed: () => print("add"),
                        icon: const Icon(Icons.add_circle_outline),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => print("favorite"),
                    icon: const Icon(Icons.favorite_border),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product!.name!,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  RichText(
                    text: TextSpan(
                      text: "UGX ",
                      style: const TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey,
                      ),
                      children: [
                        TextSpan(
                          text: "${product!.price}",
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
                  const SizedBox(height: 8.0),
                  Text(
                    "${product!.description}",
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 9,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 4.0,
                      right: 4.0,
                      top: 4.0,
                    ),
                    height: 70,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        border: Border.all(width: 2.0),
                        color: Colors.white),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.savings),
                              Text("Great Saving"),
                            ],
                          ),
                        ),
                        VerticalDivider(
                          width: 8.0,
                          indent: 2.0,
                          endIndent: 2.0,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.repeat),
                              Text("Easy returns ")
                            ],
                          ),
                        ),
                        VerticalDivider(
                          width: 5.0,
                          indent: 2.0,
                          endIndent: 2.0,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.wallet),
                              Text("100% Payment Protection"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Card(
                    child: Table(
                      border: TableBorder.all(
                          color: Colors.black,
                          width: 1.5,
                          borderRadius: BorderRadius.circular(5.0)),
                      columnWidths: const {},
                      children: [
                        TableRow(children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Store"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(product!.company!.toUpperCase()),
                          )
                        ]),
                        TableRow(children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Rating"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(product!.averageRating.toString()),
                          )
                        ]),
                        TableRow(children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Original price"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("UGX ${product!.price!.toInt()}"),
                          )
                        ]),
                        TableRow(children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Free shipping"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(product!.freeShipping!
                                ? "Available"
                                : "Not available"),
                          )
                        ]),
                        const TableRow(children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Sold by"),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("Gegabox"),
                          )
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
