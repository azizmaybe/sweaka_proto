import 'dart:convert';

Storage storageFromJson(String str) => Storage.fromJson(json.decode(str));

String storageToJson(Storage data) => json.encode(data.toJson());

class Storage {
    Storage({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
    });

    int count;
    String next;
    String previous;
    List<Result> results;

    Storage copyWith({
        int? count,
        String? next,
        String? previous,
        List<Result>? results,
    }) => 
        Storage(
            count: count ?? this.count,
            next: next ?? this.next,
            previous: previous ?? this.previous,
            results: results ?? this.results,
        );

    factory Storage.fromJson(Map<String, dynamic> json) => Storage(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };

  toMap() {}

  static fromMap(e) {}
}

class Result {
    Result({
        required this.id,
        required this.product,
        required this.displayId,
        required this.createdAt,
        required this.updatedAt,
        required this.quantity,
        required this.seller,
        required this.quantityOrder,
    });

    String id;
    Product product;
    int displayId;
    DateTime createdAt;
    DateTime updatedAt;
    int quantity;
    String seller;
    String quantityOrder;

    Result copyWith({
        String? id,
        Product? product,
        int? displayId,
        DateTime? createdAt,
        DateTime? updatedAt,
        int? quantity,
        String? seller,
        String? quantityOrder,
    }) => 
        Result(
            id: id ?? this.id,
            product: product ?? this.product,
            displayId: displayId ?? this.displayId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            quantity: quantity ?? this.quantity,
            seller: seller ?? this.seller,
            quantityOrder: quantityOrder ?? this.quantityOrder,
        );

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        product: Product.fromJson(json["product"]),
        displayId: json["display_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        quantity: json["quantity"],
        seller: json["seller"],
        quantityOrder: json["quantity_order"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product": product.toJson(),
        "display_id": displayId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "quantity": quantity,
        "seller": seller,
        "quantity_order": quantityOrder,
    };
}

class Product {
    Product({
        required this.id,
        required this.subCategory,
        required this.um,
        required this.displayId,
        required this.createdAt,
        required this.updatedAt,
        required this.image,
        required this.name,
        required this.tva,
        required this.ean,
        required this.lastPurchasedPrice,
        required this.unit,
        required this.valid,
        required this.isOrderable,
        required this.quantityMin,
        required this.weight,
        required this.quantityOfUnit,
        required this.isExpirable,
        required this.needRefrigerator,
        required this.brand,
        required this.providers,
    });

    String id;
    SubCategory subCategory;
    Um um;
    int displayId;
    DateTime createdAt;
    DateTime updatedAt;
    String image;
    String name;
    int tva;
    String ean;
    int lastPurchasedPrice;
    int unit;
    bool valid;
    bool isOrderable;
    int quantityMin;
    int weight;
    int quantityOfUnit;
    bool isExpirable;
    bool needRefrigerator;
    String brand;
    List<String> providers;

    Product copyWith({
        String? id,
        SubCategory? subCategory,
        Um? um,
        int? displayId,
        DateTime? createdAt,
        DateTime? updatedAt,
        String? image,
        String? name,
        int? tva,
        String? ean,
        int? lastPurchasedPrice,
        int? unit,
        bool? valid,
        bool? isOrderable,
        int? quantityMin,
        int? weight,
        int? quantityOfUnit,
        bool? isExpirable,
        bool? needRefrigerator,
        String? brand,
        List<String>? providers,
    }) => 
        Product(
            id: id ?? this.id,
            subCategory: subCategory ?? this.subCategory,
            um: um ?? this.um,
            displayId: displayId ?? this.displayId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            image: image ?? this.image,
            name: name ?? this.name,
            tva: tva ?? this.tva,
            ean: ean ?? this.ean,
            lastPurchasedPrice: lastPurchasedPrice ?? this.lastPurchasedPrice,
            unit: unit ?? this.unit,
            valid: valid ?? this.valid,
            isOrderable: isOrderable ?? this.isOrderable,
            quantityMin: quantityMin ?? this.quantityMin,
            weight: weight ?? this.weight,
            quantityOfUnit: quantityOfUnit ?? this.quantityOfUnit,
            isExpirable: isExpirable ?? this.isExpirable,
            needRefrigerator: needRefrigerator ?? this.needRefrigerator,
            brand: brand ?? this.brand,
            providers: providers ?? this.providers,
        );

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        subCategory: SubCategory.fromJson(json["sub_category"]),
        um: Um.fromJson(json["um"]),
        displayId: json["display_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: json["image"],
        name: json["name"],
        tva: json["tva"],
        ean: json["ean"],
        lastPurchasedPrice: json["last_purchased_price"],
        unit: json["unit"],
        valid: json["valid"],
        isOrderable: json["is_orderable"],
        quantityMin: json["quantity_min"],
        weight: json["weight"],
        quantityOfUnit: json["quantity_of_unit"],
        isExpirable: json["is_expirable"],
        needRefrigerator: json["need_refrigerator"],
        brand: json["brand"],
        providers: List<String>.from(json["providers"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sub_category": subCategory.toJson(),
        "um": um.toJson(),
        "display_id": displayId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "image": image,
        "name": name,
        "tva": tva,
        "ean": ean,
        "last_purchased_price": lastPurchasedPrice,
        "unit": unit,
        "valid": valid,
        "is_orderable": isOrderable,
        "quantity_min": quantityMin,
        "weight": weight,
        "quantity_of_unit": quantityOfUnit,
        "is_expirable": isExpirable,
        "need_refrigerator": needRefrigerator,
        "brand": brand,
        "providers": List<dynamic>.from(providers.map((x) => x)),
    };
}

class SubCategory {
    SubCategory({
        required this.id,
        required this.displayId,
        required this.createdAt,
        required this.updatedAt,
        required this.name,
        required this.description,
        required this.image,
        required this.validatedAt,
        required this.publicAt,
        required this.productCategory,
    });

    String id;
    int displayId;
    DateTime createdAt;
    DateTime updatedAt;
    String name;
    String description;
    String image;
    DateTime validatedAt;
    DateTime publicAt;
    String productCategory;

    SubCategory copyWith({
        String? id,
        int? displayId,
        DateTime? createdAt,
        DateTime? updatedAt,
        String? name,
        String? description,
        String? image,
        DateTime? validatedAt,
        DateTime? publicAt,
        String? productCategory,
    }) => 
        SubCategory(
            id: id ?? this.id,
            displayId: displayId ?? this.displayId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            name: name ?? this.name,
            description: description ?? this.description,
            image: image ?? this.image,
            validatedAt: validatedAt ?? this.validatedAt,
            publicAt: publicAt ?? this.publicAt,
            productCategory: productCategory ?? this.productCategory,
        );

    factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"],
        displayId: json["display_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        description: json["description"],
        image: json["image"],
        validatedAt: DateTime.parse(json["validated_at"]),
        publicAt: DateTime.parse(json["public_at"]),
        productCategory: json["product_category"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "display_id": displayId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
        "description": description,
        "image": image,
        "validated_at": validatedAt.toIso8601String(),
        "public_at": publicAt.toIso8601String(),
        "product_category": productCategory,
    };
}

class Um {
    Um({
        required this.id,
        required this.productCount,
        required this.displayId,
        required this.createdAt,
        required this.updatedAt,
        required this.name,
        required this.description,
    });

    String id;
    String productCount;
    int displayId;
    DateTime createdAt;
    DateTime updatedAt;
    String name;
    String description;

    Um copyWith({
        String? id,
        String? productCount,
        int? displayId,
        DateTime? createdAt,
        DateTime? updatedAt,
        String? name,
        String? description,
    }) => 
        Um(
            id: id ?? this.id,
            productCount: productCount ?? this.productCount,
            displayId: displayId ?? this.displayId,
            createdAt: createdAt ?? this.createdAt,
            updatedAt: updatedAt ?? this.updatedAt,
            name: name ?? this.name,
            description: description ?? this.description,
        );

    factory Um.fromJson(Map<String, dynamic> json) => Um(
        id: json["id"],
        productCount: json["product_count"],
        displayId: json["display_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        name: json["name"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_count": productCount,
        "display_id": displayId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "name": name,
        "description": description,
    };
}
