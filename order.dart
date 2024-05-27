import 'package:flutter/material.dart';
import 'package:western/pages/PaymentPage.dart';
import 'orderItems.dart';  // Update the import to match your project structure

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  List<Map<String, dynamic>> orderItems = [
    {"name": "Iced Americano", "price": "\$1.25", "image": "3", "quantity": 2},
    {"name": "Olatte", "price": "\$1.25", "image": "18", "quantity": 2},
  ];

  void updateQuantity(int index, int newQuantity) {
    setState(() {
      orderItems[index]['quantity'] = newQuantity;
    });
  }

  void deleteItem(int index) {
    setState(() {
      orderItems.removeAt(index);
    });
  }

  //item amount
  double calculateItemTotalPrice(int index) {
    double price = double.parse(orderItems[index]['price'].substring(1)); // Remove the '$' sign and parse to double
    return price * orderItems[index]['quantity'];
  }

  //total amount
  double calculateTotal() {
    double total = 0;
    for (var item in orderItems) {
      double price = double.parse(item['price'].substring(1)); // Remove the '$' sign and parse to double
      total += price * item['quantity'];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 94, 134, 143),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 94, 134, 143),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
          ),
          iconSize: 35,
        ),
        title: Center(
          child: Text(
            "Order Summary",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.notifications,
              color: Colors.white,
              size: 35,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 2, left: 12, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.red, Colors.blue],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
                height: 4,
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                child: Text(
                  "Your order summary",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 10),
              for (int i = 0; i < orderItems.length; i++)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: OrderItems(
                    name: orderItems[i]['name'],
                    price: orderItems[i]['price'],
                    image: orderItems[i]['image'],
                    quantity: orderItems[i]['quantity'],
                    onQuantityChanged: (newQuantity) => updateQuantity(i, newQuantity),
                    onDelete: () => deleteItem(i),
                  ),
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26.withOpacity(0.4),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                      gradient: LinearGradient(
                        colors: [Colors.white, Colors.grey[200]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Enter Coupon Code Here:)",
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 87, 82, 82),
                            ),
                            fillColor: Color.fromARGB(255, 215, 211, 211),
                            filled: true,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              child: Icon(
                                Icons.local_offer,
                                color: Colors.redAccent,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(
                                color: Colors.blueAccent,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(
                                color: Colors.redAccent,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Add your coupon code logic here
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  backgroundColor: Color.fromARGB(171, 82, 147, 146),
                                  foregroundColor: Color.fromARGB(255, 232, 241, 244),
                                ),
                                child: Text(
                                  "Apply Coupon",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bill Summary",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10),
                    // Display each item in the bill summary
                    for (int i = 0; i < orderItems.length; i++)
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${orderItems[i]['name']} x${orderItems[i]['quantity']}",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "\$${calculateItemTotalPrice(i).toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          
                        ],
                      ),
                      SizedBox(height: 5),
                      Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                      SizedBox(height: 5),
                      // Calculate and display subtotal
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotal",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "\$${calculateTotal().toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    // Display discount (update value as per logic)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Discount",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "-\$0.00", // Update this value as per the coupon discount logic
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 1,
                    ),
                    // Calculate and display total
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "\$${calculateTotal().toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left : 5,top: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(137, 247, 247, 247).withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 20,
                      offset: Offset(0, 14),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentPage(orderItems: orderItems,)), );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 110), // Adjust padding
                        textStyle: TextStyle(
                          fontSize: 18, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: Text(
                        'Confirm your order',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
