import 'get_home_response.dart';

class GetOrderResponse {
  GetOrderResponse({
    this.id,
    this.user,
    this.totalAmount,
    this.count,
    this.createdAt,
    this.updatedAt,
    this.items,
    this.orderStatus,
    this.date,
    this.time
  });

  final int? id;
  final dynamic user;
  num? totalAmount;
  final int? count ;
  final String? createdAt;
  final String? updatedAt;
  final List<Items>? items ;
  final String? orderStatus;
  final String? date;
  final String? time;

  factory GetOrderResponse.fromJson(Map<String, dynamic> json) => GetOrderResponse(
    id: json["id"],
    user: json["user"],
    totalAmount: json["total_amount"],
    count: json["count"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    items: List<Items>.from(json["items"].map((x) => Items.fromJson(x))),
      orderStatus: json["order_status"],
      time: json["time"],
    date: json["date"],
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
    this.extras,
    this.price,
  });
  final int? id;
  final int? quantity;
  final num? totalAmount;
  final String? createdAt;
  final String? updatedAt;
  final Product? product;
  final List<Extras>? extras;
  final String? price ;



  factory Items.fromJson(Map<String, dynamic> json) => Items(
    id: json["id"],
    quantity: json["quantity"],
    totalAmount: json["total_amount"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    product: Product.fromJson(json["product"]),
    extras: List<Extras>.from(json["extras"].map((x) => Extras.fromJson(x))),
    price: json["price"]

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