import 'package:api_shopping/controller/Homescreen_controller.dart';

import 'package:flutter/material.dart';

Container customcontainer(HomescreenController homecontroller, int index) {
    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(homecontroller.productlist[index].image.toString()),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 20,
                                  right: 20,
                                  child: Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Icon(Icons.favorite_outline),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(padding: EdgeInsets.only(left: 8)),
                          Text(
                            homecontroller.productlist[index].title.toString(),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Padding(padding: EdgeInsets.only(left: 8)),
                          Text(
                            homecontroller.productlist[index].price.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey),
                          )
                        ],
                      ),
                    );
  }
