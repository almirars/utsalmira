//kode utama Aplikasi tampilan awal
import 'package:flutter/material.dart';
import 'package:stok_anggrek/item/item_page.dart';
import 'package:stok_anggrek/supp/supplier_page.dart';
import 'package:stok_anggrek/screen/detail.dart';
// import 'package:stok_anggrek/screen/home.dart';
import 'package:stok_anggrek/screen/myhome.dart';

//package letak folder Anda
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      // title: 'Tambahkan Item',
      // theme: ThemeData(
      //   primarySwatch: Colors.blueGrey,
      // ),
      // home: ItemPage(),
      // Item: ItemPage(),
      // initialRoute: '/',
      routes: {
        '/': (_) => MyHome(),
        ItemPage.ItemP: (_) => ItemPage(),
        SuppPage.SuppP: (_) => SuppPage(),
        Detail.routeName: (_) => Detail(),
      },
    );
  }
}
