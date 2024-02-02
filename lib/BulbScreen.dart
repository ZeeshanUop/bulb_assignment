import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BulbScreen extends StatefulWidget {
  @override
  _BulbScreenState createState() => _BulbScreenState();
}

class _BulbScreenState extends State<BulbScreen> {
  bool isBulbOn = false;
  bool switchstatus = false;

  @override
  void initState() {
    super.initState();
    _loadBulbState();
  }

  void _loadBulbState() async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    setState(() {
      isBulbOn = prefs.getBool('isBulbOn') ?? false;
    });
  }

  void _saveBulbState(bool value) async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    prefs.setBool('isBulbOn', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bulb App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lightbulb,
              size: 100.0,
              color: isBulbOn ? Colors.yellow : Colors.black,
            ),
            SizedBox(height: 20.0),
            Switch(
              value: isBulbOn,
              onChanged: (value) {
                setState(() {
                  isBulbOn = value;
                  _saveBulbState(value);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
