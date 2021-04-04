import 'package:flutter/material.dart';
import 'package:stok_anggrek/supp/supplier.dart';

class EntrySupplier extends StatefulWidget {
  final Supplier supplier;
  EntrySupplier(this.supplier);
  @override
  EntrySupplierState createState() => EntrySupplierState(this.supplier);
}

//class controller
class EntrySupplierState extends State<EntrySupplier> {
  Supplier supplier;
  EntrySupplierState(this.supplier);
  TextEditingController nameController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
//kondisi
    if (supplier != null) {
      nameController.text = supplier.name;
      alamatController.text = supplier.alamat;
    }
//rubah
    return Scaffold(
        appBar: AppBar(
          title: supplier == null ? Text('Tambah') : Text('Ubah'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
            children: <Widget>[
// nama
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nama Supplier',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
//
                  },
                ),
              ),
// alamat
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: TextField(
                  controller: alamatController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Alamat Supplier',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
//
                  },
                ),
              ),

// tombol button
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
// tombol simpan
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (supplier == null) {
// tambah data
                            supplier = Supplier(
                              nameController.text,
                              alamatController.text,
                            );
                          } else {
// ubah data
                            supplier.name = nameController.text;
                            supplier.alamat = alamatController.text;
                          }
// kembali ke layar sebelumnya dengan membawa objek item
                          Navigator.pop(context, supplier);
                        },
                      ),
                    ),
                    Container(
                      width: 5.0,
                    ),
// tombol batal
                    Expanded(
                      child: RaisedButton(
                        color: Theme.of(context).primaryColorDark,
                        textColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          'Cancel',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
