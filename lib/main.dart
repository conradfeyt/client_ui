import 'package:clinical_ui/view/view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _updatedValue = "";
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    LineItem _lineItem = LineItem(0);

    handler(String value) {
      setState(() {
        print("__$value");
        _updatedValue = value;
        _lineItem.qty = value.toNum();
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 170,
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
              child: Form(
                key: _form,
                child: Column(
                  children: [
                    NumberInputControl(
                      handler: (String value) => handler(value),
                      minimum: 0,
                      maximum: 100,
                      stepSize: 1,
                      precision: 0,
                      label: 'No decimals',
                      autoValidate: true,
                      helperText: "enter a value between 0 and 100",
                    ),
                    NumberInputControl(
                      value: _lineItem.qty.toString(),
                      handler: (String value) => handler(value),
                      minimum: 0,
                      maximum: 100,
                      stepSize: 0.1,
                      precision: 1,
                      label: '1 decimal',
                    ),
                    NumberInputControl(
                      value: _lineItem.qty.toString(),
                      handler: (String value) => handler(value),
                      minimum: 0,
                      maximum: 100,
                      stepSize: 0.05,
                      precision: 2,
                      label: '2 decimal',
                    ),
                    MaterialButton(
                        child: const Text("Validate"),
                        onPressed: () {
                          _form.currentState?.validate();
                        }),
                    Text(_updatedValue),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LineItem {
  num qty;
  LineItem(this.qty);
}

extension on String {
  num toNum() => num.tryParse(this)?.roundToDouble() ?? 0;
}
