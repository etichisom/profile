// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    final email = find.byValueKey('email');
    final name = find.byValueKey('name');
    final password = find.byValueKey('password');
    final button = find.byValueKey('butt');
    final sbutton = find.byValueKey('s');
    final lbutton = find.byValueKey('out');


   FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      driver.close();
    });
  test('create account', ()async{
      await driver.tap(sbutton);
      await driver.tap(email);
      await driver.enterText('chisom@gmail.com');
      await driver.tap(name);
      await driver.enterText('chisom@g');
      await driver.tap(password);
      await driver.enterText('12345');
      await driver.tap(button);
      //await driver.waitFor(find.text('Sign up'));

     // await driver.tap(signup);



  });

  });
}