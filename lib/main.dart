import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Determinator',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChoicePage(title: 'Determinator'),
    );
  }
}

class ChoicePage extends StatefulWidget {
  final String title;

  ChoicePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ChoicePage> {
  List options = [];
  final textController = TextEditingController();

  void _addOption() {
    setState(() {
      if (textController.text != '') {
        options.add(textController.text);
        textController.text = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Determine what you\'ll do.',
            ),
            TextField(
                controller: textController,
                decoration: new InputDecoration(
                    hintText: "Enter option",
                    contentPadding: const EdgeInsets.all(20.0),
                    isDense: true),
                onSubmitted: (value) {
                  _addOption();
                }),
            RaisedButton(
              onPressed: _addOption,
              color: Colors.green,
              child: Text('Add option'),
            ),
            Text(options.toString()),
          ],
        ),
      ),
    );
  }
}
