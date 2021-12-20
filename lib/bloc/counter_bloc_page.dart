import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return BlocListener<CounterBloc, int>(
      listener: (prevState, currentState) {
        if ((currentState % 5) == 0) {
          _scaffoldKey.currentState?.hideCurrentSnackBar();
          _scaffoldKey.currentState?.showSnackBar(
            SnackBar(
              content: Text('Count is $currentState'),
              duration: Duration(seconds: 1),
            ),
          );
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(title: const Text('Bloc - Counter')),
        body: BlocBuilder<CounterBloc, int>(
          builder: (context, count) {
            return Center(
              child: Text(
                '$count',
                style: const TextStyle(fontSize: 24.0),
              ),
            );
          },
        ),
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  counterBloc.increment();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: FloatingActionButton(
                child: const Icon(Icons.remove),
                onPressed: () {
                  counterBloc.decrement();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
