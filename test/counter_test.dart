import 'package:api_test_using_unit_test/controllers/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
/*
  // pre test
  setUp(() => ());
  setUpAll(() => ());

  // setup is called before every test.
  // setupall is called before all tests

  Setup -> test -> Setup -> test -> Setup -> Setup
  SetupAll -> test -> test -> test
*/

  late Counter counter;

  setUp(() => {counter = Counter()});

  group("Counter Class - ", () {
    // given when then
    test(
        "given a counter class when it is initilize then value of count should be 0",
        () {
      // Act
      final val = counter.count;
      //Assert
      expect(val, 0);
    });

    test(
        "given the counter class when it is incremented then value of counter should be 1",
        () {
      // Act
      counter.increment();
      int val = counter.count;
      // Assert
      expect(val, 1);
    });

    test(
        "given the counter class when it is decremented then value of counter should be -1",
        () {
      // Act
      counter.decrement();
      int val = counter.count;
      // Assert
      expect(val, -1);
    });


    test(
        "given the counter class when it is reset then value of counter should be 0",
        () {
      // Act
      counter.resetCounter();
      int val = counter.count;
      // Assert
      expect(val, 0);
    });
  });



  /*
  //post test
  tearDown(() => {});
  tearDownAll(() => {});

  // tearDown is called after every test.
  // tearDownAll is called after all tests.

  test -> tearDown -> test -> tearDown -> test -> tearDown
  test -> test -> test -> tearDownAll
  */
}
