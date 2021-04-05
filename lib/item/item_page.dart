import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:stok_anggrek/dbhelper.dart';
import 'package:stok_anggrek/item/entryForm.dart';
import 'package:stok_anggrek/item/item.dart';
import 'package:stok_anggrek/helper/main_drawer.dart';

//pendukung program asinkron
class ItemPage extends StatefulWidget {
  // router untuk memanggil halaman ItemPage pada main
  static const ItemP = '/itemPage';
  @override
  ItemPageState createState() => ItemPageState();
}

class ItemPageState extends State<ItemPage> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Item> itemList;
  @override
  Widget build(BuildContext context) {
    updateListView();
    if (itemList == null) {
      itemList = List<Item>();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Item'),
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
              child: Text("Tambah Item"),
              onPressed: () async {
                var item = await navigateToEntryForm(context, null);
                if (item != null) {
//TODO 2 Panggil Fungsi untuk Insert ke DB
                  int result = await dbHelper.insertItem(item);
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

  Future<Item> navigateToEntryForm(BuildContext context, Item item) async {
    var result = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return EntryForm(item);
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
              // child: Icon(Icons.ad_units),
              child: Text(this.itemList[index].id.toString()),
            ),
            title: Text(
              this.itemList[index].name,
              style: textStyle,
            ),
            subtitle: Text(this.itemList[index].price.toString()),
            trailing: GestureDetector(
              child: Icon(Icons.delete),
              onTap: () async {
//TODO 3 Panggil Fungsi untuk Delete dari DB berdasarkan Item
                // dbHelper.delete(this.itemList[index].id);
                int result = await dbHelper.deleteItem(this.itemList[index].id);
                if (result > 0) {
                  updateListView();
                }
              },
            ),
            onTap: () async {
              var item =
                  await navigateToEntryForm(context, this.itemList[index]);
//TODO 4 Panggil Fungsi untuk Edit data
              // dbHelper.update(item);
              int result = await dbHelper.updateItem(item);
              if (result > 0) {
                updateListView();
              }
            },
          ),
        );
      },
    );
  }

//update List item
  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
//TODO 1 Select data dari DB
      Future<List<Item>> itemListFuture = dbHelper.getItemList();
      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }
}
