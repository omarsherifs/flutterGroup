part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsSuccess extends ProductsState {}

class ProductsError extends ProductsState {
  final String errorMessage;
  ProductsError(this.errorMessage);
}
