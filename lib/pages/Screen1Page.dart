import 'package:flutter/material.dart';
import 'package:task2/pages/Screen2Page.dart';

class Screen1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen 1")),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Screen2Page()));
          },
          child: Text("Go To Screen 2"),
        ),
      ),
    );
  }
}
