class Package {
  final String title;
  final String price;
  final String description;

  Package({
    required this.title,
    required this.price,
    required this.description,
  });

  factory Package.fromJson(Map<String, dynamic> json) {
    return Package(
      title: json['title'],
      price: json['price'],
      description: json['desc'],
    );
  }
}
