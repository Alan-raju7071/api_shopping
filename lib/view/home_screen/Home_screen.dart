import 'package:api_shopping/controller/Homescreen_controller.dart';
import 'package:api_shopping/controller/Mycart_controller.dart';
import 'package:api_shopping/view/product%20details/product_details.dart';

import 'package:api_shopping/view/wiggets/customcontainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
   await context.read<HomescreenController>().getdata();
   await context.read<HomescreenController>().getallproduct();
   await    context.read<MycartController>().initdb();

  },);
  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
            appBar: AppBar(
                title: Text(
                  "Discover",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.black),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Stack(children: [
                      Icon(
                        Icons.notifications_none_outlined,
                        color: Colors.black,
                        size: 30,
                      ),
                      Positioned(
                        right: 0,
                        top: 2,
                        child: CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 9,
                            child: Text(
                              "1",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 10),
                            )),
                      )
                    ]),
                  ),
                ]),
            body: Consumer<HomescreenController>(
              builder: (context, homecontroller, child) => 
               Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 15),
                          height: 45,
                          width: 270,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 223, 211, 211),
                              borderRadius: BorderRadius.circular(7)),
                          child: Row(children: [
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Search anything",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ]),
                        ),
                      ),
                      SizedBox(width: 15),

                        Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 5),
                    ],
                  ),
                  SizedBox(
                    height: 15,

                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      
                      
                      
                      
                      children: 
                      List.generate(
                        
                        homecontroller.categorylist.length,
                       (index) => Padding(
                                 padding: const EdgeInsets.all(10),
                                 child: InkWell(onTap: () async {
                                   context.read<HomescreenController>().oncategoryselection(index);
                                  await context.read<HomescreenController>().getallproduct();
                                 },
                                   child: Container(
                                    width: 130,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: homecontroller.Selectedcategoryindex==index ?Colors.black :Colors.grey
                                    ),
                                    padding: EdgeInsets.all(10),
                                    child: Center(
                                      child: Text(homecontroller.categorylist[index].toString(),
                                      style: TextStyle(
                                        color: homecontroller.Selectedcategoryindex==index ? Colors.white :Colors.black
                                      ),
                                      ),
                                    ),
                                    
                                   
                                   ),
                                 ),
                               )
                       
                       ,)
                    
                      
                    ),
                  ),











                  SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child:
                    homecontroller.isproductloading ? Center(child: CircularProgressIndicator(),)
                   :  GridView.builder(
                      padding: EdgeInsets.all(10),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 0.6),
                      itemCount: homecontroller.productlist.length,
                      itemBuilder: (context, index) => 
                      InkWell(
                        onTap: () {
                          if(homecontroller.productlist[index].id !=null)
                          Navigator.push(context,
                           MaterialPageRoute(builder: (context) => Productdetails(productId: homecontroller.productlist[index].id!)));
                        },
                        child: customcontainer(homecontroller, index)),
                    ),
                  )
                ],
              ),
            ),);
  }

}