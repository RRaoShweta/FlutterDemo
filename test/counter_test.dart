import 'package:state_management_demo/testing/counter.dart';
import 'package:test/test.dart';

void main() {
  test('Counter Value should incremented', () {
    final counter = CounterTesting();
    counter.increment();
    expect(counter.value, 1);
  });

  test('Counter Value should decrement', () {
    final counter = CounterTesting();
    counter.decrement();
    expect(counter.value, -1);
  });
}
