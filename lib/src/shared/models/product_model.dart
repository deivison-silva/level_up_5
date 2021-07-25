class ProductModel {
  final String id;
  final String name;
  final double price;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
  });

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ price.hashCode;

  @override
  bool operator ==(other) =>
      other is ProductModel &&
      other.id == id &&
      other.name == name &&
      other.price == price;
}
