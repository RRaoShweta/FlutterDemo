import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_demo/Provider/counter_model.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counterModel = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider - Counter"),
      ),
      body: Center(
        child: Text(
          'Counter Value is: ${counterModel.getCounter()}',
          style: const TextStyle(fontSize: 25.0),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => counterModel.incrementCounter(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 30),
          FloatingActionButton(
            onPressed: () => counterModel.decrementCounter(),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
