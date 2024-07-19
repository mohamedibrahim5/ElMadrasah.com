class MaterialModel {
  final int? id;
  final String? englishData;
  final String? arabicData;
  final String? forData;
  final String? image;


  MaterialModel({this.id, this.englishData,this.arabicData,this.forData,this.image,});

  factory MaterialModel.fromJson(Map<String, dynamic> json) {
    return MaterialModel(
        id: json['id'],
        englishData: json['english_data'],
        arabicData: json['arabic_data'],
         forData: json['for_data'],
        image: json['image'],
    );
  }
}

class SubsriptionModel {
  final int? id;
  final String? term;
  final String? arabicTerm;
  final String? forData;
  final String? discount;
  final String? period;
  final String? arabicPeriod;
  final String? price;


  SubsriptionModel({this.id, this.term,this.arabicTerm,this.forData,this.discount,this.price,this.arabicPeriod,this.period});

  factory SubsriptionModel.fromJson(Map<String, dynamic> json) {
    return SubsriptionModel(
      id: json['id'],
      term: json['term'],
      arabicTerm: json['term_arabic'],
      forData: json['for_data'],
      discount: json['discount'],
        period : json['period'],
      arabicPeriod: json['period_arabic'],
      price: json['price']
    );
  }
}

class BestSellers {
  final int? id;
  final String? category;
  final String? title;
  final String? description;
  final String? image;
  final String? price;
  final String? oldPrice;
  final int? quantity ;
  final int? items ;
  final bool? isNewest;
  final bool? isBestSeller;
  final List<Questions>? questions;

  BestSellers({this.id, this.category,this.title,this.description,this.image,this.price,this.oldPrice,this.quantity,this.items,this.isNewest,this.isBestSeller,this.questions});

  factory BestSellers.fromJson(Map<String, dynamic> json) {
    return BestSellers(
      id: json['id'],
      category: json['category'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
      oldPrice: json['old_price'],
      quantity: json['quantity'],
      items: json['items'],
      isNewest: json['is_newest'],
      isBestSeller: json['is_best_seller'],
      questions: json['questions'] != null ? (json['questions'] as List).map((i) => Questions.fromJson(i)).toList() : null,
    );
  }
}



class Questions {
  final int? id;
  final int? product;
  final String? title;
  final List<Extras>? extras;
  final String? click ;

  Questions({this.id, this.product, this.title,this.extras,this.click});

  factory Questions.fromJson(Map<String, dynamic> json) {
    return Questions(
      id: json['id'],
      product: json['product'],
      title: json['title'],
      extras: json['extras'] != null ? (json['extras'] as List).map((i) => Extras.fromJson(i)).toList() : null,
      click: json['click'],
    );
  }
}

class Extras {
  final int? id;
  final String? title;
  final String? price;
  final String? click ;
   bool? isSelectedCHECK ;
   bool? isSelectedOPTIONAL ;

  Extras({this.id, this.title, this.price,this.isSelectedCHECK = false,this.click,this.isSelectedOPTIONAL = false});

  factory Extras.fromJson(Map<String, dynamic> json) {
    return Extras(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      click: json['click'],
    );
  }
}


