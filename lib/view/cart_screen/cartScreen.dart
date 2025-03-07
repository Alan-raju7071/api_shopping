import 'package:api_shopping/controller/Mycart_controller.dart';
import 'package:api_shopping/view/cart_screen/widget/cartwidgetitem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await context.read<MycartController>().getAllproduct();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartScreenController = context.watch<MycartController>();


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Cart"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CartItemWidget(
                          title: cartScreenController.storedproduct[index]
                              ["name"],
                              
                          amount: cartScreenController.storedproduct[index]
                              ["amount"],
                          qty: cartScreenController.storedproduct[index]["qty"]
                              .toString(),
                          image: cartScreenController.storedproduct[index]
                              ["image"],

                          onIncrement: () {
                            context.read<MycartController>().incrementqty(
                                currentqty: cartScreenController
                                    .storedproduct[index]["qty"],
                                id: cartScreenController.storedproduct[index]
                                    ["id"]);
                          },

                          onDecrement: () {
                            context.read<MycartController>().decrementqty(
                                currentqty: cartScreenController
                                    .storedproduct[index]["qty"],
                                id: cartScreenController.storedproduct[index]
                                    ["id"]);
                          },

                          onRemove: () {
                            context.read<MycartController>().removeproduct(
                                cartScreenController.storedproduct[index]
                                    ["id"]);
                          },
                        );
                      },
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 15),
                      itemCount: cartScreenController.storedproduct.length),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(.3),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Amount :",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          // Text(
                          //   "\$ ${cartScreenController..toStringAsFixed(2)}",
                          //   style: TextStyle(
                          //       color: Colors.red,
                          //       fontWeight: FontWeight.bold,
                          //       fontSize: 20),
                          // ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          // Razorpay razorpay = Razorpay();
                          // var options = {
                          //   'key': 'rzp_live_ILgsfZCZoFIKMb',
                          //   'amount': 100,
                          //   'name': 'Acme Corp.',
                          //   'description': 'Fine T-Shirt',
                          //   'retry': {'enabled': true, 'max_count': 1},
                          //   'send_sms_hash': true,
                          //   'prefill': {
                          //     'contact': '8888888888',
                          //     'email': 'test@razorpay.com'
                          //   },
                          //   'external': {
                          //     'wallets': ['paytm']
                          //   }
                          // };
                          // razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                          //     handlePaymentErrorResponse);
                          // razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                          //     handlePaymentSuccessResponse);
                          // razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                          //     handleExternalWalletSelected);
                          // razorpay.open(options);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                "PAY",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              // Icon(
                              //   Icons.shopping_cart_checkout_rounded,
                              //   color: Colors.white,
                              // )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  // void handlePaymentErrorResponse(PaymentFailureResponse response) {
  //   /*
  //   * PaymentFailureResponse contains three values:
  //   * 1. Error Code
  //   * 2. Error Description
  //   * 3. Metadata
  //   * */
  //   showAlertDialog(context, "Payment Failed",
  //       "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  // }

  // void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
  //   /*
  //   * Payment Success Response contains three values:
  //   * 1. Order ID
  //   * 2. Payment ID
  //   * 3. Signature
  //   * */
  //   showAlertDialog(
  //       context, "Payment Successful", "Payment ID: ${response.paymentId}");
  // }

  // void handleExternalWalletSelected(ExternalWalletResponse response) {
  //   showAlertDialog(
  //       context, "External Wallet Selected", "${response.walletName}");
  // }

  // void showAlertDialog(BuildContext context, String title, String message) {
  //   // set up the buttons
  //   Widget continueButton = ElevatedButton(
  //     child: const Text("Continue"),
  //     onPressed: () {},
  //   );
  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: Text(title),
  //     content: Text(message),
  //   );
  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }
}