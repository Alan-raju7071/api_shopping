import 'package:api_shopping/controller/Homescreen_controller.dart';
import 'package:api_shopping/controller/Mycart_controller.dart';
import 'package:api_shopping/controller/Productdetailscontroller.dart';
import 'package:api_shopping/view/home_screen/Home_screen.dart';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => HomescreenController(),),
      ChangeNotifierProvider(create: (context) => Productdetailscontroller(),),
      ChangeNotifierProvider(create: (context) => MycartController())
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
void main(){
  runApp(Myapp());
}