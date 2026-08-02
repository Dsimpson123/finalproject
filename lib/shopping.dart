import 'package:flutter/material.dart';
import 'cart.dart';


class ShoppingPage extends StatefulWidget {

  const ShoppingPage({super.key});


  @override
  State<ShoppingPage> createState() => _ShoppingPageState();

}




class _ShoppingPageState extends State<ShoppingPage> {


  final List<Map<String, dynamic>> products = [


    {
      "name":"Oversized Hoodie",
      "brand":"Vision",
      "price":"\$85",
      "icon":Icons.checkroom,
    },


    {
      "name":"Cargo Pants",
      "brand":"District",
      "price":"\$120",
      "icon":Icons.straighten,
    },


    {
      "name":"Jordan Sneakers",
      "brand":"Motion",
      "price":"\$150",
      "icon":Icons.directions_run,
    },


    {
      "name":"Classic White Tee",
      "brand":"Essence",
      "price":"\$45",
      "icon":Icons.dry_cleaning,
    },


  ];





  void addCart(String item){


    ScaffoldMessenger.of(context).showSnackBar(

      SnackBar(

        content:Text(

          "$item added to cart",

        ),

      ),

    );


  }





  @override
  Widget build(BuildContext context){


    return Scaffold(

      backgroundColor:Colors.white,



      appBar:AppBar(

        backgroundColor:Colors.white,

        elevation:0,


        title:const Text(

          "SHOPPING",

          style:TextStyle(

            color:Colors.black,

            fontWeight:FontWeight.bold,

            letterSpacing:2,

          ),

        ),

        actions: [

          IconButton(

            onPressed: () {

              Navigator.push(

                context,

                MaterialPageRoute(builder: (context) => const CartPage()),

              );

            },

            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.black),

          ),

        ],

      ),




      body:Padding(

        padding:const EdgeInsets.all(18),


        child:Column(

          crossAxisAlignment:

          CrossAxisAlignment.start,



          children:[



            Container(

              padding:

              const EdgeInsets.symmetric(

                horizontal:15,

              ),


              decoration:BoxDecoration(

                color:Colors.grey.shade200,

                borderRadius:

                BorderRadius.circular(20),

              ),



              child:const TextField(

                decoration:InputDecoration(

                  hintText:"Search clothes...",

                  border:InputBorder.none,

                  icon:Icon(

                    Icons.search,

                  ),

                ),

              ),

            ),





            const SizedBox(height:25),





            const Text(

              "Recommended For You",

              style:TextStyle(

                fontSize:25,

                fontWeight:FontWeight.bold,

              ),

            ),





            const SizedBox(height:15),





            Expanded(

              child:ListView.builder(


                itemCount:products.length,


                itemBuilder:(context,index){


                  final product = products[index];



                  return Container(

                    margin:

                    const EdgeInsets.only(

                      bottom:15,

                    ),



                    padding:

                    const EdgeInsets.all(18),



                    decoration:BoxDecoration(

                      color:Colors.black,

                      borderRadius:

                      BorderRadius.circular(20),

                    ),



                    child:Row(

                      children:[




                        Container(

                          height:80,

                          width:80,


                          decoration:BoxDecoration(

                            color:Colors.white,

                            borderRadius:

                            BorderRadius.circular(15),

                          ),



                          child:Icon(

                            product["icon"],

                            size:45,

                            color:Colors.black,

                          ),

                        ),




                        const SizedBox(width:20),




                        Expanded(

                          child:Column(

                            crossAxisAlignment:

                            CrossAxisAlignment.start,


                            children:[


                              Text(

                                product["brand"],

                                style:TextStyle(

                                  color:

                                  Colors.grey.shade400,

                                ),

                              ),



                              Text(

                                product["name"],

                                style:const TextStyle(

                                  color:Colors.white,

                                  fontSize:18,

                                  fontWeight:

                                  FontWeight.bold,

                                ),

                              ),



                              Text(

                                product["price"],

                                style:const TextStyle(

                                  color:Colors.white,

                                  fontSize:16,

                                ),

                              ),



                            ],

                          ),

                        ),





                        IconButton(

                          onPressed:(){


                            addCart(

                              product["name"],

                            );


                          },


                          icon:const Icon(

                            Icons.add_shopping_cart,

                            color:Colors.white,

                          ),

                        )




                      ],

                    ),

                  );


                },


              ),

            )




          ],


        ),


      ),


    );


  }


}