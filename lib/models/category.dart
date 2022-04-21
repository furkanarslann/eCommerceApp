class Category {
  int? id;
  String? categoryName;
  String? seoUrl;

  Category({
    required this.id,
    required this.categoryName,
    required this.seoUrl,
  });

  Category.fromJson(Map json) {
    this.id = json['id'];
    this.categoryName = json['categoryName'];
    this.seoUrl = json['seoUrl'];
  }

  Map toJson() {
    return {'id': id, 'categoryName': categoryName, 'seoUrl': seoUrl};
  }
}
