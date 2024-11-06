

import 'package:api_shopping/controller/Mycart_controller.dart';
import 'package:api_shopping/controller/Productdetailscontroller.dart';
import 'package:api_shopping/view/my%20cart/my%20cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class Productdetails extends StatefulWidget {
  const Productdetails({super.key, required this.productId});
  final int productId;

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async =>await context
          .read<Productdetailscontroller>()
          .gets(widget.productId),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    late Productdetailscontroller productdetailscontroller=context.watch<Productdetailscontroller>();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Details",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          actions: const [
            Stack(
              children: [
                Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                Positioned(
                    right: 0,
                    top: 3,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 7,
                      child: Text(
                        "1",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ))
              ],
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
        body: Consumer<Productdetailscontroller>(
            builder: (context, productDetailsController, child) =>
                productDetailsController.isloading
                    ? Center(child: CircularProgressIndicator())
                    : Column(children: [
                        Expanded(
                            child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 25, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  alignment: Alignment.topRight,
                                  height: 400,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              productDetailsController
                                                  .product!.image
                                                  .toString()))),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: EdgeInsets.all(10),
                                    child: Icon(
                                      Icons.favorite_outline,
                                      size: 30,
                                    ),
                                  ),
                                ),
                                Text(
                                  productDetailsController.product!.title
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                SizedBox(height: 20),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Text(
                                      productDetailsController
                                          .product!.rating!.rate
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Text(
                                  productDetailsController.product!.description
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Choose size",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: 20),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                          border: Border.all(
                                              width: 2, color: Colors.grey)),
                                      child: Center(
                                          child: Text(
                                        "S",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      )),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                          border: Border.all(
                                              width: 2, color: Colors.grey)),
                                      child: Center(
                                          child: Text(
                                        "M",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      )),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            5,
                                          ),
                                          border: Border.all(
                                              width: 2, color: Colors.grey)),
                                      child: Center(
                                          child: Text(
                                        "L",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      )),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
                        Divider(
                          height: 1,
                          thickness: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Price",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                                Text(
                                  productDetailsController.product!.price
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              ],
                            ),
                            SizedBox(width: 50),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  context.read<MycartController>().Addproduct(productDetailsController.product!);
                                  context.read<MycartController>().getAllproduct();
                                   Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => Cartwidgetitem.cartwdgetitem(
                                      title: "title",
                                      desc: "desc",
                                      qty: "qty",
                                      image: productdetailscontroller.product!.image.toString(),
                                      onDecrement: () {
                                        
                                      },
                                      onIncrement: () {
                                        
                                      },
                                      onRemove: () {
                                        
                                      },

                                    ),));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 20),
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.local_mall_outlined,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Add to cart",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ]),
                        )
    ])));
  }
}