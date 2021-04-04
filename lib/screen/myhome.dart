import 'package:flutter/material.dart';
import 'package:stok_anggrek/screen/detail.dart';
import 'package:stok_anggrek/helper/main_drawer.dart';

class MyHome extends StatelessWidget {
  static const home = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Hai!',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            // RaisedButton(
            //   child: Text('Details'),
            //   onPressed: () {
            //     // Navigator.push(
            //     //     context,
            //     //     MaterialPageRoute(
            //     //       builder: (context) => Detail(),
            //     //     ));

            //     Navigator.of(context).pushNamed(Detail.routeName);
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
