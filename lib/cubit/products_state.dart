part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}
class GetProdectsLoding extends ProductsState{}
class GetProdectssecces extends ProductsState{}
class GetProdectsError extends ProductsState{}
class SearchProductes extends ProductsState{}
