import 'package:d/bloc/count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'D Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        lazy: true,
        create: (context) => CounterCubit(),
        child: MyHomePage(title: 'Home'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("$title ${BlocProvider.of<CounterCubit>(context).state}"),
      ),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, count) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${count}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () {
          context.read<CounterCubit>().increment();
          print("-----------------------------------------------------------");
          print(
              "${context.read<CounterCubit>().state} dhgywgywguwgwytgwywtgytwytyw");

          Navigator.push(context, MaterialPageRoute(builder: (_) {
            print(
                "${BlocProvider.of<CounterCubit>(context).runtimeType} its type is CounterCubit dhgywgywguwgwytgwywtgytwytyw");
            // print(context);
            return AnotherTextWidget(
                context: context, key: const PageStorageKey("here"));
          }));
        },
        child: const Icon(Icons.add),
      ), // T
    );
  }
}

class AnotherTextWidget extends StatefulWidget {
  BuildContext context;

  AnotherTextWidget({Key? key, required this.context}) : super(key: key);

  @override
  State<AnotherTextWidget> createState() => _AnotherTextWidgetState();
}

class _AnotherTextWidgetState extends State<AnotherTextWidget> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<CounterCubit>(widget.context);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    BlocProvider.of<CounterCubit>(widget.context);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>.value(
      value: BlocProvider.of<CounterCubit>(widget.context),
      child: Scaffold(
        key: const PageStorageKey("Here"),
        body: SafeArea(
          child: Column(
            children: [
              BlocBuilder<CounterCubit, int>(builder: (bloc, state) {
                return Text("$state");
              }),
              // ,
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<CounterCubit>(widget.context).increment();
            Navigator.push(
              widget.context,
              MaterialPageRoute(
                builder: (_) => ThirdScreen(context: widget.context),
              ),
            );
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class ThirdScreen extends StatelessWidget {
  BuildContext context;

  ThirdScreen({required this.context, super.key});

  @override
  Widget build(BuildContext _) {
    return Scaffold(
        body: BlocProvider<CounterCubit>.value(
      value: BlocProvider.of<CounterCubit>(context),
      child: BlocBuilder<CounterCubit, int>(builder: (bloc, state) {
        return Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            children: [
              Text("$state"),
              OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("BACK")),
            ],
          ),
        );
      }),
    ));
  }
}
