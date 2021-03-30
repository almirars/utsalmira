import 'package:flutter/material.dart';
import 'package:stok_anggrek/screen/detail.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Lagi dirumah',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            RaisedButton(
              child: Text('Details'),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detail(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
