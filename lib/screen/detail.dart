import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  static const routeName = '/detail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Lagi di halaman detail',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            FloatingActionButton(
              child: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
