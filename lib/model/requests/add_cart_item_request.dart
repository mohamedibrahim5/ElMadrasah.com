class AddCartItemRequest {
final int? productId;
final int? quantity;
final List<int?> extrasaIds ;

  AddCartItemRequest({required this.productId, required this.quantity,required this.extrasaIds});

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'quantity': quantity,
      'extras_ids':extrasaIds
    };
  }
}



class PatchCartItemRequest {
  final int? productId;
  final int? quantity;
  final List<int?> extrasaIds ;

  PatchCartItemRequest({required this.productId, required this.quantity,required this.extrasaIds});

  Map<String, dynamic> toJson() {
    return {
        'cart_item_id': productId,
      'quantity': quantity,
      'extras_ids':extrasaIds
    };
  }
}