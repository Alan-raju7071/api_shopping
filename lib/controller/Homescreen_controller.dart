import 'dart:convert';
import 'dart:developer';

import 'package:api_shopping/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomescreenController with ChangeNotifier{
  int Selectedcategoryindex=0;
    List categorylist=[];
    bool isloading=false;
    bool isproductloading=false;
    List<productmodel> productlist=[];
    Future<void> getdata() async {
        final url=Uri.parse("https://fakestoreapi.com/products/categories");
        try{
            var response=await  http.get(url);
            if(response.statusCode==200){
              final  convertjson=jsonDecode(response.body);
              log(convertjson.toString());
              categorylist=convertjson;
               categorylist.insert(0, "All");


            }


        }
        catch(e){
            print(e);

        }
        notifyListeners();
    }
    oncategoryselection(int clickedindex) async {
      if(Selectedcategoryindex !=clickedindex && isproductloading ==false){
      
      Selectedcategoryindex=clickedindex;
      notifyListeners();
     await getallproduct();
      
      }
    }
    getallproduct() async {
      isproductloading=true;
      notifyListeners();
      final allpruductsurl=Uri.parse("https://fakestoreapi.com/products");
      final pruductscategoryurl=Uri.parse("https://fakestoreapi.com/products/category/${categorylist[Selectedcategoryindex]}");
      
      
      try{
        final response=await http.get(Selectedcategoryindex==0 ?allpruductsurl:pruductscategoryurl);
        if(response.statusCode==200){
          productlist=productmodelfromjson(response.body);
        }

      }
      catch(e){
        print(e);
      }
      isproductloading=false;
      notifyListeners();
    }
    getproductsbycategory(){}
}