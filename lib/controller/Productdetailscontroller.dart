import 'dart:convert';

import 'package:api_shopping/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Productdetailscontroller with ChangeNotifier{
  productmodel?product;
  bool isloading=false;
  Future<void> gets( int productId) async {
    isloading=true;
    notifyListeners();
    final url=Uri.parse("https://fakestoreapi.com/products/$productId");
    try{
      final response=await http.get(url);
      if(response.statusCode==200){
        product=productmodel.fromJson(jsonDecode(response.body));

      }

    }
    catch(e){
      print(e);
    }
    isloading=false;
    notifyListeners();

  }

}