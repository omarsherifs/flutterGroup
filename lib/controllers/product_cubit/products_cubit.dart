import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_1/models/products_model.dart';
import 'package:flutter_group_1/service/products_service.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial()) {
    getProductsList();
  }

  List<Product> productList = [];

  Future<void> getProductsList() async {
    emit(ProductsLoading());
    try {
      productList = await ProductsService.getProductsData();
      emit(ProductsSuccess());
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }
}
