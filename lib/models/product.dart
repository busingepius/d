class Product {
  final String? id;
  final String? name;
  final String? description;
  final List? images;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? price;
  final int? inventory;
  final double? averageRating;
  final int? numOfReviews;
  final String? category;
  final String? company;
  final bool? featured;
  final bool? freeShipping;
  final List? reviews;
  final List? colors;
  final List? sizes;

  Product({
    this.id,
    this.name,
    this.description,
    this.images,
    this.createdAt,
    this.updatedAt,
    this.price,
    this.inventory,
    this.averageRating,
    this.numOfReviews,
    this.category,
    this.company,
    this.featured,
    this.freeShipping,
    this.reviews,
    this.colors,
    this.sizes,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["_id"],
      name: json["name"],
      description: json["description"],
      images: json["image"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      price: json["price"],
      inventory: json["inventory"],
      averageRating: json["averageRating"].toDouble(),
      numOfReviews: json["numOfReviews"],
      category: json["category"],
      company: json["company"],
      featured: json["featured"],
      freeShipping: json["freeShipping"],
      reviews: json["reviews"] ?? [],
      colors: json["colors"],
      sizes: json["sizes"],
    );
  }

  Map<dynamic, Object?> toJson(){
    return {
      "_id":id,
      name:name,
      description:description,
      "image":images,
      createdAt:createdAt!.toIso8601String(),
      updatedAt:updatedAt!.toIso8601String(),
      price:price,
      inventory:inventory,
      averageRating:averageRating,
      numOfReviews:numOfReviews,
      category: category,
      company:company,
      featured:featured,
      freeShipping:freeShipping,
      reviews:reviews,
      colors: colors,
      sizes:sizes,
    };
  }



}
