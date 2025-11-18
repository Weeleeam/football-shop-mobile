import 'dart:convert';

ProductEntry productEntryFromJson(String str) =>
    ProductEntry.fromJson(json.decode(str));
String productEntryToJson(ProductEntry data) => json.encode(data.toJson());

class ProductEntry {
  String id;
  String name;
  String category;
  int price;
  String description;
  String thumbnail;
  int productViews;
  bool isFeatured;
  int userId;
  String userUsername;

  ProductEntry({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.thumbnail,
    required this.productViews,
    required this.isFeatured,
    required this.userId,
    required this.userUsername,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
    id: json["id"] ?? 0,
    name: json["name"] ?? "",
    category: json["category"] ?? "",
    price: json["price"] ?? 0,
    description: json["description"] ?? "",
    thumbnail: json["thumbnail"] ?? "",
    productViews: json["product_views"] ?? 0,
    isFeatured: json["is_featured"] ?? false,
    userId: json["user_id"] ?? 0,
    userUsername: json["user_username"] ?? "",
  );

  get user => null;

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "category": category,
    "price": price,
    "description": description,
    "thumbnail": thumbnail,
    "product_views": productViews,
    "is_featured": isFeatured,
    "user_id": userId,
    "user_username": userUsername,
  };
}
