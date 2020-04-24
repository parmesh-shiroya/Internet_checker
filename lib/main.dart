import 'package:flutter/material.dart';
import 'package:task2/internetChecker.dart';
import 'package:task2/pages/Screen1Page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task 2',
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
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    startInternetChecker();

    onInternetStatusChanged.listen((onData) => {
          if (onData == ConnectionStatus.CONNECTED)
            {
              _showDialog(context, "Internet connected",
                  "You are connected to internet")
            }
          else
            {
              _showDialog(context, "Internet disconnected",
                  "You are not connected to internet")
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Screen1Page();

  }

  _showDialog(BuildContext context, title, text) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: Text(text),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
