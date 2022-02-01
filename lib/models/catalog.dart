import 'dart:convert';

class CatalogModel {
  static List<Items> items = [];
}

class Items {
  int id;
  String image;
  String name;
  num price;
  String desc;

  Items({required this.id, required this.image, required this.name, required this.price, required this.desc});

  Items copyWith({
    int? id,
    String? image,
    String? name,
    num? price,
    String? desc,
  }) {
    return Items(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'price': price,
      'desc': desc,
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      id: map['id'],
      image: map['image'],
      name: map['name'],
      price: map['price'],
      desc: map['desc'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Items.fromJson(String source) => Items.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Items(id: $id, image: $image, name: $name, price: $price, desc: $desc)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Items &&
        other.id == id &&
        other.image == image &&
        other.name == name &&
        other.price == price &&
        other.desc == desc;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        image.hashCode ^
        name.hashCode ^
        price.hashCode ^
        desc.hashCode;
  }
}
