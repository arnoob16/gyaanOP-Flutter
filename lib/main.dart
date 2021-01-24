import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/gyaan.dart';
import 'package:flutter_app/list_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MaterialApp(title: 'Welcome to Flutter', home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Gyaan> _gyaanList = new List();

  void getData() async {
    http.Response response = await http.get("https://inshorts.vercel.app/all");
    setState(() {
      _gyaanList =
          Gyaans.fromJson(json.decode(response.body.toString())).gyaans;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 5,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Gyaan",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              Text(
                "OP",
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        body: Container(
            alignment: Alignment.topCenter,
            child: ListView.builder(
              itemCount: _gyaanList.length,
              itemBuilder: (context, index) => ListItem(_gyaanList[index]),
            )),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }
}
