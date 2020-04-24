import 'package:flutter/material.dart';
import 'package:task2/pages/Screen3Page.dart';

class Screen2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen 2")),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => Screen3Page()));
          },
          child: Text("Go To Screen 3"),
        ),
      ),
    );
  }
}
