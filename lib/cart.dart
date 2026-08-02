import 'package:flutter/material.dart';


class CartPage extends StatefulWidget {
  const CartPage({super.key});


  @override
  State<CartPage> createState() => _CartPageState();

}



class _CartPageState extends State<CartPage> {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _cardController = TextEditingController();

  final TextEditingController _notesController = TextEditingController();


  List<CartItem> cartItems = [

    CartItem(
      brand: "Vision",
      name: "Oversized Hoodie",
      price: 85,
      image: "lib/images/tshirt.png",
    ),

    CartItem(
      brand: "District",
      name: "Cargo Pants",
      price: 120,
      image: "lib/images/yellow.png",
    ),

    CartItem(
      brand: "Motion",
      name: "Jordan Sneakers",
      price: 150,
      image: "lib/images/tshirt.png",
    ),

  ];



  double get totalPrice {

    double total = 0;

    for(var item in cartItems){

      total += item.price;

    }

    return total;

  }



  @override
  void dispose() {

    _nameController.dispose();

    _addressController.dispose();

    _cardController.dispose();

    _notesController.dispose();

    super.dispose();

  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(

      backgroundColor: Colors.white,


      appBar: AppBar(

        backgroundColor: Colors.white,

        elevation: 0,


        iconTheme:
        const IconThemeData(
          color: Colors.black,
        ),


        title: const Text(

          "CART",

          style: TextStyle(

            color: Colors.black,

            fontWeight: FontWeight.bold,

            letterSpacing: 2,

          ),

        ),

      ),



      body: Column(

        children: [


          Expanded(

            child: ListView(

              padding: const EdgeInsets.all(18),

              children: [

                if (cartItems.isEmpty)

                  Container(

                    padding: const EdgeInsets.all(24),

                    decoration: BoxDecoration(

                      color: Colors.grey.shade100,

                      borderRadius: BorderRadius.circular(20),

                    ),

                    child: const Text(

                      "Your cart is empty.",

                      textAlign: TextAlign.center,

                      style: TextStyle(fontSize: 16, color: Colors.black),

                    ),

                  )

                else

                  ...List.generate(cartItems.length, (index) {

                    final item = cartItems[index];

                    return Container(

                      margin: const EdgeInsets.only(bottom: 15),

                      padding: const EdgeInsets.all(15),

                      decoration: BoxDecoration(

                        color: Colors.black,

                        borderRadius: BorderRadius.circular(20),

                      ),

                      child: Row(

                        children: [

                          Container(

                            height: 80,

                            width: 80,

                            decoration: BoxDecoration(

                              color: Colors.white,

                              borderRadius: BorderRadius.circular(15),

                            ),

                            child: ClipRRect(

                              borderRadius: BorderRadius.circular(15),

                              child: Image.asset(

                                item.image,

                                fit: BoxFit.cover,

                              ),

                            ),

                          ),

                          const SizedBox(width: 20),

                          Expanded(

                            child: Column(

                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [

                                Text(

                                  item.brand,

                                  style: TextStyle(color: Colors.grey.shade400),

                                ),

                                Text(

                                  item.name,

                                  style: const TextStyle(

                                    color: Colors.white,

                                    fontSize: 18,

                                    fontWeight: FontWeight.bold,

                                  ),

                                ),

                                Text(

                                  "\$${item.price}",

                                  style: const TextStyle(

                                    color: Colors.white,

                                    fontSize: 16,

                                  ),

                                ),

                              ],

                            ),

                          ),

                          IconButton(

                            onPressed: () {

                              setState(() {

                                cartItems.removeAt(index);

                              });

                            },

                            icon: const Icon(

                              Icons.delete_outline,

                              color: Colors.white,

                            ),

                          )

                        ],

                      ),

                    );

                  }),

                const SizedBox(height: 20),

                const Text(

                  "Checkout Details",

                  style: TextStyle(

                    fontSize: 20,

                    fontWeight: FontWeight.bold,

                    color: Colors.black,

                  ),

                ),

                const SizedBox(height: 12),

                Form(

                  key: _formKey,

                  child: Column(

                    children: [

                      TextFormField(

                        controller: _nameController,

                        decoration: InputDecoration(

                          labelText: "Full name",

                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),

                        ),

                        validator: (value) => value == null || value.trim().isEmpty ? "Enter your name" : null,

                      ),

                      const SizedBox(height: 12),

                      TextFormField(

                        controller: _addressController,

                        decoration: InputDecoration(

                          labelText: "Shipping address",

                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),

                        ),

                        validator: (value) => value == null || value.trim().isEmpty ? "Enter your address" : null,

                      ),

                      const SizedBox(height: 12),

                      TextFormField(

                        controller: _cardController,

                        keyboardType: TextInputType.number,

                        decoration: InputDecoration(

                          labelText: "Card number",

                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),

                        ),

                        validator: (value) => value == null || value.trim().length < 4 ? "Enter a valid card number" : null,

                      ),

                      const SizedBox(height: 12),

                      TextFormField(

                        controller: _notesController,

                        maxLines: 3,

                        decoration: InputDecoration(

                          labelText: "Order notes",

                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),

                        ),

                      ),

                    ],

                  ),

                ),

              ],

            ),

          ),

          Container(

            padding:
            const EdgeInsets.all(20),


            decoration:
            const BoxDecoration(

              color: Colors.black,

            ),


            child:
            Column(

              children: [


                Row(

                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,


                  children: [


                    const Text(

                      "Total",

                      style:
                      TextStyle(

                        color:
                        Colors.white,

                        fontSize:20,

                        fontWeight:
                        FontWeight.bold,

                      ),

                    ),



                    Text(

                      "\$${totalPrice.toStringAsFixed(2)}",

                      style:
                      const TextStyle(

                        color:
                        Colors.white,

                        fontSize:22,

                        fontWeight:
                        FontWeight.bold,

                      ),

                    ),


                  ],

                ),



                const SizedBox(height:15),




                SizedBox(

                  width:
                  double.infinity,


                  height:
                  55,


                  child:
                  ElevatedButton(

                    onPressed:(){

                      if (_formKey.currentState!.validate() && cartItems.isNotEmpty) {

                        Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder: (context) => ConfirmationPage(

                              customerName: _nameController.text.trim(),

                              total: totalPrice,

                              itemCount: cartItems.length,

                            ),

                          ),

                        );

                        setState(() {

                          cartItems.clear();

                        });

                      } else if (cartItems.isEmpty) {

                        ScaffoldMessenger.of(context).showSnackBar(

                          const SnackBar(

                            content: Text("Add items to your cart before checking out."),

                            backgroundColor: Colors.black,

                          ),

                        );

                      }

                    },


                    style:
                    ElevatedButton.styleFrom(

                      backgroundColor:
                      Colors.white,

                      foregroundColor:
                      Colors.black,


                      shape:
                      RoundedRectangleBorder(

                        borderRadius:
                        BorderRadius.circular(18),

                      ),

                    ),



                    child:
                    const Text(

                      "Checkout",

                      style:
                      TextStyle(

                        fontWeight:
                        FontWeight.bold,

                        fontSize:17,

                      ),

                    ),

                  ),

                ),


              ],

            ),

          )


        ],

      ),

    );


  }


}



// ---------------- CART ITEM MODEL ----------------


class ConfirmationPage extends StatelessWidget {
  final String customerName;
  final double total;
  final int itemCount;

  const ConfirmationPage({
    super.key,
    required this.customerName,
    required this.total,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          "ORDER CONFIRMED",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  const Icon(Icons.check_circle, color: Colors.white, size: 70),
                  const SizedBox(height: 16),
                  const Text(
                    "Purchase Successful",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Thanks, $customerName! Your order for $itemCount item(s) is on the way.",
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Total paid: \$${total.toStringAsFixed(2)}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                ),
                child: const Text(
                  "Back to Shopping",
                  style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem {


  final String brand;

  final String name;

  final double price;

  final String image;



  CartItem({

    required this.brand,

    required this.name,

    required this.price,

    required this.image,

  });


}