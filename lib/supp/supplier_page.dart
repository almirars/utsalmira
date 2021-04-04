import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:stok_anggrek/helper/main_drawer.dart';
import 'dart:async';
import 'package:stok_anggrek/dbhelper.dart';
import 'package:stok_anggrek/supp/entrySupplier.dart';
// import 'package:stok_anggrek/item/entryForm.dart';
// import 'package:stok_anggrek/item/item.dart';
import 'package:stok_anggrek/supp/supplier.dart';

//pendukung program asinkron
class SuppPage extends StatefulWidget {
  static const SuppP = '/SuppPage';
  @override
  SuppPageState createState() => SuppPageState();
}

class SuppPageState extends State<SuppPage> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Supplier> suppList;
  @override
  Widget build(BuildContext context) {
    updateListView();
    if (suppList == null) {
      suppList = List<Supplier>();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Supplier'),
      ),
      drawer: MainDrawer(),
      body: Column(children: [
        Expanded(
          child: createListView(),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: RaisedButton(
              child: Text("Tambah Supplier"),
              onPressed: () async {
                var supplier = await navigateToEntryForm(context, null);
                if (supplier != null) {
//TODO 2 Panggil Fungsi untuk Insert ke DB
                  int result = await dbHelper.insertSupp(supplier);
                  if (result > 0) {
                    updateListView();
                  }
                }
              },
            ),
          ),
        ),
      ]),
    );
  }

  Future<Supplier> navigateToEntryForm(
      BuildContext context, Supplier supplier) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntrySupplier(supplier);
    }));
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.headline5;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.ad_units),
            ),
            title: Text(
              this.suppList[index].nama,
              style: textStyle,
            ),
            subtitle: Text(this.suppList[index].alamat),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
//TODO 3 Panggil Fungsi untuk Delete dari DB berdasarkan Supplier
                dbHelper.deleteSupp(this.suppList[index].id);
                int result = await dbHelper.deleteSupp(this.suppList[index].id);
                if (result > 0) {
                  updateListView();
                }
              },
            ),
            onTap: () async {
              var supplier =
                  await navigateToEntryForm(context, this.suppList[index]);
//TODO 4 Panggil Fungsi untuk Edit data
              dbHelper.updateSupp(supplier);
              int result = await dbHelper.updateSupp(supplier);
              if (result > 0) {
                updateListView();
              }
            },
          ),
        );
      },
    );
  }

//update List Supplier
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
//TODO 1 Select data dari DB
      Future<List<Supplier>> supplierListFuture = dbHelper.getSupplierList();
      supplierListFuture.then((suppList) {
        setState(() {
          this.suppList = suppList;
          this.count = suppList.length;
        });
      });
    });
  }
}
