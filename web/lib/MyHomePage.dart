import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';

import 'DepartmentPage.dart';
import 'DptQuestion.dart';

class MyHomePage extends StatefulWidget {
  static String id = "My Home Page";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final StreamController _dividerController = StreamController<int>();


  dispose() {
    _dividerController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xffDDC3FF), elevation: 0.0),
      backgroundColor: Color(0xffDDC3FF),
      body: ListView(children: <Widget>[
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "SPIN THE WHEEL",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SpinningWheel(
              Image.asset('images/wheel-6-300.png'),
              width: 350,
              height: 350,
              initialSpinAngle: _generateRandomAngle(),
              spinResistance: 0.6,
              canInteractWhileSpinning: false,
              dividers: 8,
              onUpdate: _dividerController.add,
              onEnd: _dividerController.add,
              secondaryImage: Image.asset('images/roulette-center-300.png'),
              secondaryImageHeight: 110,
              secondaryImageWidth: 110,
            ),
            SizedBox(height: 30),
            StreamBuilder(
              stream: _dividerController.stream,
              builder: (context, snapshot) =>
              snapshot.hasData ? RouletteScore(snapshot.data) : Container(),
            )
          ],
        ),
        DptQuestion(),
      ]),
    );
  }

  double _generateRandomAngle() => Random().nextDouble() * pi * 2;
}

class RouletteScore extends StatelessWidget {
  final int selected;
  //final int number;
  // ignore: non_constant_identifier_names
  static String SpinLabel;

  final Map<int, String> labels = {
    1: '1',
    2: '2',
    3: '3',
    4: '4',
    5: '5',
    6: '6',
    7: '7',
    8: '8'
  };

  /* style: TextStyle(fontStyle: FontStyle.italic, fontSize: 124.0)),
  );*/

  RouletteScore(this.selected);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>new DepartmentPage(selected)));
        // ignore: non_constant_identifier_names
        SpinLabel= "${labels[selected]}";
        print(SpinLabel);

      },
      child: Text('${labels[selected]}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 124.0)),
    );
  }
}
