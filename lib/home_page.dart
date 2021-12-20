import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_demo/main.dart';

import 'Provider/counter_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ChangeNotifierProvider<CounterProvider>.value(
                              value: CounterProvider(),
                              child: ProviderStateDemo()),
                    ));
              },
              child: Text('Provider'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BlocStateDemo(),
                    ));
              },
              child: Text('Bloc Demo'),
            ),
          ],
        ),
      ),
    );
  }
}
