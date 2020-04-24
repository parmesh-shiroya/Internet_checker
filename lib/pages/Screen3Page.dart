import 'package:flutter/material.dart';
import 'package:task2/pages/Screen1Page.dart';

class Screen3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Screen 3")),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => Screen1Page()),
                ModalRoute.withName('/'));
          },
          child: Text("Go To Screen 1"),
        ),
      ),
    );
  }
}
