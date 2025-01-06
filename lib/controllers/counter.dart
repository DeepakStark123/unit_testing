
class Counter {
  int _counter = 0;

  int get count => _counter;

  int increment() => _counter++;

  int decrement() => _counter--;

  int resetCounter() => (_counter = 0);
}
