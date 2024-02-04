import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_group_1/models/category_model.dart';

class FirebaseCloudStoreUtil {
  static var db = FirebaseFirestore.instance;
  static String categoryCollectionName = "categories";

  static Future<bool> addNewCategory(CategoryModel model) async {
    bool result = false;
    try {
      await db.collection(categoryCollectionName).add(model.toJson());
      result = true;
    } catch (e) {
      print(e.toString());
    }
    return result;
  }

  static Future<bool> deleteCategory(String id) async {
    bool result = false;
    try {
      await db.collection(categoryCollectionName).doc(id).delete();
      result = true;
    } catch (e) {
      print(e.toString());
    }
    return result;
  }
}
