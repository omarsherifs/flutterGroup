class CategoryModel {
  final String name;
  final String itemNo;
  final String image;
  final String desc;
  const CategoryModel({
    required this.name,
    required this.desc,
    required this.image,
    required this.itemNo,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "item_no": itemNo,
        "photo_url": image,
        "desc": desc,
      };
}
