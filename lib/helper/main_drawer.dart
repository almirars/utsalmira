import 'package:flutter/material.dart';
import 'package:stok_anggrek/item/item_page.dart';
import 'package:stok_anggrek/supp/supplier_page.dart';
import 'package:stok_anggrek/screen/myhome.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 80,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 15,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                            'https://i.mydramalist.com/p3LJD_5f.jpg',
                          ),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Text(
                    'Almira Rahma',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'almirasabita@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Home',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(MyHome.home);
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text(
              'Item',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(ItemPage.ItemP);
            },
            // onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'Supplier',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamed(SuppPage.SuppP);
            },
            // onTap: null,
          ),
        ],
      ),
    );
  }
}
