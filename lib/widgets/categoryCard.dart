import 'package:d/constants/mock.dart';
import 'package:d/models/models.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Category? category;

  const CategoryCard({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          var category = categories[index];
          return Container(
            margin: const EdgeInsets.only(
              left: 4.0,
              right: 4.0,
              top: 5.0,
            ),
            child: GestureDetector(
              onTap: () {
                print(category.category);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.grey[300]!,
                              width: 2.0,
                              style: BorderStyle.solid),
                          gradient: RadialGradient(
                              colors: [category.begin, category.end],
                              center: const Alignment(0, 0),
                              radius: 0.8,
                              focal: const Alignment(0, 0),
                              focalRadius: 0.1),
                          image: DecorationImage(
                            image: NetworkImage(category!.image),
                          )),
                      padding: const EdgeInsets.all(8.0),
                    ),
                  ),
                  Center(
                    child: Text(
                        category.category,
                        textAlign: TextAlign.right,
                        style:const TextStyle(fontSize:10.0),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
