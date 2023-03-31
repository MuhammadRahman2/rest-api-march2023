class Products {
  final int id;
  final Attribute attribute;

  Products( {required this.id,
   required this.attribute
   });

  factory Products.fromJson(Map<String, dynamic> json) {
    final attribute =  Attribute(sku: json['attributes']['sku'], title: json['attributes']['title'], slug: json['attributes']['slug']);
    return Products(
      id: json['id'],
     attribute:attribute
     );
  }
}

class Attribute {
  final String sku;
  final String title;
  final String slug;

  Attribute({required this.sku, required this.title, required this.slug});

  // factory Attribute.fromJson(Map<String, dynamic> json) {
  //   return Attribute(sku: json['sku'], title: json['title'], slug: json['slug']);
  // }
}
