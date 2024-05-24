import 'package:flutter/material.dart';

class CustomScrollViewExample extends StatefulWidget {
  const CustomScrollViewExample({super.key});

  @override
  State<CustomScrollViewExample> createState() =>
      _CustomScrollViewExampleState();
}

class _CustomScrollViewExampleState extends State<CustomScrollViewExample> {
  List<int> top = <int>[];
  List<int> bottom = <int>[0];

  @override
  Widget build(BuildContext context) {
    const Key centerKey = ValueKey<String>('bottom-sliver-lis');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Press on the plus to add items above and below'),
        leading: IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              top.add(-top.length - 1);
              bottom.add(bottom.length);
            });
          },
        ),
      ),
      body: CustomScrollView(
        // center: centerKey,
        slivers: <Widget>[
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              childAspectRatio: 0.7,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  // height: 300,
                  child: Column(
                    children: [
                      Expanded(child: Text('Grid Item $index')),
                      Expanded(child: Text('Grid Item $index')),
                      Expanded(child: Text('Grid Item $index')),
                      Expanded(child: Text('Grid Item $index')),
                      Expanded(child: Text('Grid Item $index')),
                      Expanded(child: Text('Grid Item $index')),
                      Expanded(child: Text('Grid Item $index')),
                      Expanded(child: Text('Grid Item $index')),
                      Expanded(child: Text('Grid Item $index')),
                    ],
                  ),
                );
              },
              // childCount: 20,
            ),
          ),
          ////////////////////////////////////////////////////
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //         (BuildContext context, int index) {
          //       return Container(
          //         alignment: Alignment.center,
          //         color: Colors.blue[200 + top[index] % 4 * 100],
          //         height: 100 + top[index] % 4 * 20.0,
          //         child: Text('Item: ${top[index]}'),
          //       );
          //     },
          //     childCount: top.length,
          //   ),
          // ),
          // SliverList(
          //   key: centerKey,
          //   delegate: SliverChildBuilderDelegate(
          //         (BuildContext context, int index) {
          //       return Container(
          //         alignment: Alignment.center,
          //         color: Colors.blue[200 + bottom[index] % 4 * 100],
          //         height: 100 + bottom[index] % 4 * 20.0,
          //         child: Text('Item: ${bottom[index]}'),
          //       );
          //     },
          //     childCount: bottom.length,
          //   ),
          // ),
          //SliverFixedExtentList(
          //       itemExtent: 50.0,
          //       delegate: SliverChildBuilderDelegate(
          //         (BuildContext context, int index) {
          //           return Container(
          //             alignment: Alignment.center,
          //             color: Colors.lightBlue[100 * (index % 9)],
          //             child: Text('List Item $index'),
          //           );
          //         },
          //       ),
          //     ),
        ],
      ),
    );
  }
}
