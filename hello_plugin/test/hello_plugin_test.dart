import 'package:flutter_test/flutter_test.dart';

import 'package:hello_plugin/hello_plugin.dart';

void main() {
  test('print Hello World', () {
    final helloPlugin = HelloPlugin();
    expect(helloPlugin.hello(), "Hello World");
    expect(helloPlugin.hello(null), "Hello World");
    expect(helloPlugin.hello("key46"), "Hello World key46");
  });
}
