// class Supplier {
//   int _id;
//   String _name;
//   String _alamat;

//   int get id => _id;
//   String get name => this._name;
//   set name(String value) => this._name = value;
//   String get alamat => this._alamat;
//   set alamat(String value) => this._alamat = value;

//   // konstruktor versi 1
//   Supplier(this._name, this._alamat);

//   // konstruktor versi 2: konversi dari Map ke Item
//   Supplier.fromMap(Map<String, dynamic> map) {
//     this._id = map['id'];
//     this._name = map['name'];
//     this._alamat = map['alamat'];
//   }

//   // konversi dari Item ke Map
//   Map<String, dynamic> toMap() {
//     Map<String, dynamic> map = Map<String, dynamic>();
//     map['id'] = this._id;
//     map['name'] = name;
//     map['alamat'] = alamat;
//     return map;
//   }
// }
