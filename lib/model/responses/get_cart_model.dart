import 'get_home_response.dart';

class GetCartModel {
  GetCartModel({
    this.id,
    this.user,
    this.totalAmount,
    this.count,
    this.createdAt,
    this.updatedAt,
    this.items
  });

  final int? id;
  final dynamic user;
   num? totalAmount;
  final int? count ;
  final String? createdAt;
  final String? updatedAt;
  final List<Items>? items ;

  factory GetCartModel.fromJson(Map<String, dynamic> json) => GetCartModel(
    id: json["id"],
    user: json["user"],
    totalAmount: json["total_amount"],
    count: json["count"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    items: List<Items>.from(json["items"].map((x) => Items.fromJson(x))),
  );

}


class ItemsUpdate {
  ItemsUpdate({
    this.total,
    this.item,
  });
  final num? total;
  final Items? item;



  factory ItemsUpdate.fromJson(Map<String, dynamic> json) => ItemsUpdate(
    total: json["total"],
    item: Items.fromJson(json["data"]),

  );

}

class Items {
  Items({
    this.id,
    this.quantity,
    this.totalAmount,
    this.createdAt,
    this.updatedAt,
    this.product,
    this.extras
  });
  final int? id;
  final int? quantity;
  final num? totalAmount;
  final String? createdAt;
  final String? updatedAt;
  final Product? product;
  final List<Extras>? extras;



  factory Items.fromJson(Map<String, dynamic> json) => Items(
    id: json["id"],
    quantity: json["quantity"],
    totalAmount: json["total_amount"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    product: Product.fromJson(json["product"]),
    extras: List<Extras>.from(json["extras"].map((x) => Extras.fromJson(x))),

  );

}


class Product {
  Product({
    this.id,
    this.category,
    this.title,
    this.description,
    this.price,
    this.image,
    this.oldPrice,
    this.quantity,
    this.items,
    this.isNewest,
    this.isBestSeller,
    this.questions,
    this.size,
    this.isAddedToCart,
  });

  final int? id;
  final String? category;
  final String? title;
  final String? description;
  final String? price;
  final String? size ;
  final String? image;
  final String? oldPrice;
  final int? quantity;
  final int? items;
  final bool? isNewest;
  final bool? isBestSeller;
  final bool? isAddedToCart ;
  final List<Questions>? questions;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    category: json["category"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    size: json["size"],
    image: json["image"],
    oldPrice: json["old_price"],
    quantity: json["quantity"],
    items: json["items"],
    isNewest: json["is_newest"],
    isBestSeller: json["is_best_seller"],
    isAddedToCart: json["is_added_to_cart"],
    questions: List<Questions>.from(json["questions"].map((x) => Questions.fromJson(x))),
  );

}