class Supplier {
  int _id;
  String _nama;
  String _alamat;

  int get id => _id;
  String get nama => this._nama;
  set nama(String value) => this._nama = value;
  String get alamat => this._alamat;
  set alamat(String value) => this._alamat = value;

  // konstruktor versi 1
  Supplier(this._nama, this._alamat);

  // konstruktor versi 2: konversi dari Map ke Item
  Supplier.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._nama = map['nama'];
    this._alamat = map['alamat'];
  }

  // konversi dari Item ke Map
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['nama'] = nama;
    map['alamat'] = alamat;
    return map;
  }
}
