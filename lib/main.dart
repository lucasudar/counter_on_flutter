import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Scaffold(
        backgroundColor: Colors.amber[300],
        appBar: AppBar(
          title: const Text('Counter on Flutter'),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              HintLabel('Tap - to decrement'),
              SizedBox(height: 8.0),
              CounterWidget(),
              SizedBox(height: 8.0),
              HintLabel('Tap + to increment')
            ],
          ),
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 2;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        color: Colors.amber[600]
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(onPressed: () {
            _decrement();
          }, icon: const Icon(Icons.remove)),
          Text('$_count', style: const TextStyle(fontSize: 20.0),),
          IconButton(onPressed: () {
            _increment();
          }, icon: const Icon(Icons.add)),
        ],
      ),
    );
  }

  _increment() {
    setState(() {
      _count++;
    });
  }

  _decrement() {
    setState(() {
      if (_count > 0) {
        _count--;
      }
    });
  }
}

class HintLabel extends StatelessWidget {
  final String text;

  const HintLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Colors.amber[200]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text, style: TextStyle(color: Colors.grey[700])),
      ),
    );
  }
}