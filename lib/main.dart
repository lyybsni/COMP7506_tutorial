import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget { // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Three sum',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Three sum homepage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  String _display;
  int sum;

  final num_one = TextEditingController();
  final num_two = TextEditingController();
  final num_three = TextEditingController();

  final String _init_str = 'Please enter three numbers and press the button to sum up';
  final String _add_str = 'The sum of the three numbers';

  _MyHomePageState(){
    _display = _init_str;
  }

  void sum_up(){
    setState((){
      sum = int.parse(num_one.text) + int.parse(num_two.text) + int.parse(num_three.text);
      _display = _add_str;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              TextField(
                controller: num_one,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'The First number',
                  )
                 ),

            TextField(
              controller: num_two,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'The second number',
                ),
              ),
              TextField(
                controller: num_three,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'The third number',
                ),
              ),
            Text(
              '$_display',
            ),
            Text(
              '$sum',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: sum_up,
        tooltip: 'sum',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
