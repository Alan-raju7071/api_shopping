
import 'dart:developer';

import 'package:api_shopping/model/home_model.dart';
import 'package:flutter/foundation.dart';


import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

class MycartController with ChangeNotifier{
  static late Database mydatabase;
  double totalvalue=0.00;
  List<Map<String,dynamic>> storedproduct=[];
  
  Future initdb() async {
    
if (kIsWeb) {
  // Change default factory on the web
  databaseFactory = databaseFactoryFfiWeb;
  
}
    mydatabase = await openDatabase("mycart.db", version: 1,
    onCreate: (Database db, int version) async {
  // When creating the db, create the table
  await db.execute(
      'CREATE TABLE mycart (id INTEGER PRIMARY KEY, name TEXT, qty INTEGER, desc TEXT, image TEXT)');
});
  }
  Future getAllproduct() async {
    var storedproduct= await mydatabase.rawQuery('SELECT * FROM mycart');
     log(storedproduct.toString());
  }





 Future Addproduct(productmodel selectedproduct) async {
   
      await getAllproduct();
      bool alreadyincart=storedproduct.any((element) => selectedproduct.id == element["productid"],);
      if (alreadyincart){
        
      }else{
         await mydatabase.rawInsert(
      'INSERT INTO mycart(name, qty,amount, image,productId) VALUES(?, ?, ?,?,?)',
      [selectedproduct.title,1,selectedproduct.price,selectedproduct.image,selectedproduct.id]);
      }
  
}





Future   removeproduct(int productId) async {
  await mydatabase
    .rawDelete('DELETE FROM mycart WHERE id = ?', [productId]);
getAllproduct();

}

incrementqty( {required int currentqty,required int id})  {
   mydatabase.rawUpdate(
    'UPDATE mycart SET qty = ?, id = ? ',
    [++currentqty,id]);
}
decrementqty({required int currentqty,required int id}){
   mydatabase.rawUpdate(
    'UPDATE mycart SET qty = ?, id = ? ',
    [--currentqty,id]);
  
}
void calculatetotalamount(){
  totalvalue=0.00;
  for (var element in storedproduct){
    totalvalue=totalvalue+(element["qty"]*element["amount"]);
  }
  
}
Future <void> cleartable()async{
  await mydatabase.delete("mycart");
}


  }
