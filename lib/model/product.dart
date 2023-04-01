class Product {
  final int id;
  final String sku;
  final String title;
  final String slug;
  final List imageLinks;

  Product({
    required this.id,
    required this.sku, 
    required this.title, 
    required this.slug,
    required this.imageLinks
    });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'], 
      sku: json['attributes']['sku'],
      title: json['attributes']['title'],
      slug: json['attributes']['slug'],
      imageLinks: json['attributes']['imageLinks'],
        );
  }
}
