import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_27/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
      static ProductsCubit get(context) => BlocProvider.of(context);
     List<productModel> products =[];
          List<productModel> searchProdects =[];
     Dio dio = Dio();
     void search(String text){
      products.where((element) => element.title!.toLowerCase().contains(text.toLowerCase())).toList();
      emit(SearchProductes());
     }


     void getProducts(){
      emit(GetProdectsLoding());
      dio.get("https://fakestoreapi.com/products").then((value) {
        if (value.statusCode==200){
          for (var element in value.data) {
            products.add(productModel.fromJson(element));
          }
          emit(GetProdectssecces());
            
          }
        }).catchError((e){
          emit(GetProdectsError());

        });
     }
   
}
