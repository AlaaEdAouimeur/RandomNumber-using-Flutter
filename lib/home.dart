import 'package:flutter/material.dart';
import 'dart:math';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  Random rnd = new Random();

  int n = 0;
  
  
  int radioval;
  void _handle(int value) {
    setState(() {
      radioval = value;
    });
  }

  void _float() {
    setState(() {
      if (radioval == 0)
        n = rnd.nextInt(10);
      else if (radioval == 1)
        n = rnd.nextInt(50);
      else
        n = rnd.nextInt(100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('Random Numbers'),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 100),
          child: Center(
              child: Column(children: <Widget>[
            Container(
                width: 200,
                height: 200,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    '$n',
                    style: TextStyle(color: Colors.redAccent),
                  ),
                )),
            RadioListTile(
              title: Text(
                'From 0 to 10',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              value: 0,
              groupValue: radioval,
              onChanged: (int value) {
                _handle(value);
              },
            ),
            RadioListTile(
              title: Text(
                'From 0 to 50',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              value: 1,
              groupValue: radioval,
              onChanged: (int value) {
                _handle(value);
              },
            ),
            RadioListTile(
              title: Text(
                'From 0 to 100',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              value: 2,
              groupValue: radioval,
              onChanged: (int value) {
                _handle(value);
              },
            ),
          ]))),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _float();
        },
        icon: Icon(Icons.add),
        label: Text(
          'Generate',
        ),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
