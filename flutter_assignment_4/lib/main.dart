// import 'dart:html';

// import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedValue;
  Map<String, bool> items = {
    'Sale': false,
    'Credit': false,
    'Refund': false,
    'Loan': false,
    'Direct Material': false,
    'Direct Labour': false,
    'Asset': false,
    'Other': false,
    'Overhead': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sort & Filter'),
        leading: Icon(
          Icons.cancel,
        ),
        actions: [
          TextButton(
            child: Text(
              'CLEAR',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: 15,
          ),
          TextButton(
            child: Text(
              'APPLY',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: 6,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Sort By',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            DropdownButton<String>(
              value: _selectedValue,
              iconEnabledColor: Colors.purple,
              underline: Container(
                height: 2,
                color: Colors.purple,
              ),
              isExpanded: true,
              items: <String>[
                "Newest first",
                "Oldest first",
                "Value High-Low",
                "Value Low-High",
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
              hint: Text(
                ('Choose an option'),
                style: TextStyle(fontSize: 13),
              ),
              onChanged: (String value) {
                setState(() {
                  _selectedValue = value;
                });
              },
            ),
            SizedBox(height: 15),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Transaction Types',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 14),
            ToggleButtons(
              borderRadius: BorderRadius.circular(32.0),
              fillColor: Colors.purple,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Money in',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Money out',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
              onPressed: (i) {},
              isSelected: [false, true],
            ),
            SizedBox(height: 3),
            Expanded(
              child: ListView(
                children: items.keys.map((String key) {
                  return new CheckboxListTile(
                    title: new Text(key),
                    value: items[key],
                    activeColor: Colors.purple,
                    checkColor: Colors.white,
                    onChanged: (bool value) {
                      setState(() {
                        items[key] = value;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
