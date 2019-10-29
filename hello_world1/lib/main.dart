import 'package:flutter/material.dart';
import 'package:hello_plugin/hello_plugin.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform = const MethodChannel('flutter.key46.com/hello_world');

  String hello3 = "";

  Future<void> _getHelloString() async {
    String halo;
    final String result = await platform.invokeMethod(
      'hello',
      {"text": "3: From native"},
    ).catchError((e) => halo = "Failed to get hello string: '${e.message}'.");
    halo = result;

    setState(() {
      hello3 = halo;
    });
  }

  @override
  void initState() {
    super.initState();
    _getHelloString();
  }

  @override
  Widget build(BuildContext context) {
    String hello1 = "Hello World 1: From app";
    String hello2 = HelloPlugin().hello("2: From plugin");

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(hello1),
            Text(hello2),
            Text(hello3),
          ],
        ),
      ),
    );
  }
}
