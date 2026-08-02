import 'package:flutter/material.dart';


class ProductPage extends StatefulWidget {


  final String brand;

  final String name;

  final String price;



  const ProductPage({

    super.key,

    required this.brand,

    required this.name,

    required this.price,

  });



  @override
  State<ProductPage> createState() => _ProductPageState();

}




class _ProductPageState extends State<ProductPage> {


  bool favorite = false;



  void addToCart(){


    ScaffoldMessenger.of(context).showSnackBar(

      const SnackBar(

        content: Text(

          "Added to cart!",

        ),

      ),

    );


  }





  @override
  Widget build(BuildContext context){


    return Scaffold(

      backgroundColor: Colors.white,



      appBar: AppBar(

        backgroundColor: Colors.white,

        elevation:0,


        iconTheme:

        const IconThemeData(

          color:Colors.black,

        ),



        title:const Text(

          "PRODUCT",

          style:TextStyle(

            color:Colors.black,

            fontWeight:FontWeight.bold,

            letterSpacing:2,

          ),

        ),



        actions:[


          IconButton(

            onPressed:(){


              setState(() {


                favorite = !favorite;


              });


            },


            icon:Icon(

              favorite

                  ? Icons.favorite

                  : Icons.favorite_border,


              color:Colors.black,

            ),


          ),



        ],


      ),





      body:Padding(

        padding:

        const EdgeInsets.all(20),



        child:Column(


          crossAxisAlignment:

          CrossAxisAlignment.start,



          children:[



            Container(

              height:250,

              width:double.infinity,


              decoration:BoxDecoration(

                color:Colors.black,

                borderRadius:

                BorderRadius.circular(25),

              ),



              child:Icon(

                Icons.checkroom,

                color:Colors.white,

                size:100,

              ),



            ),





            const SizedBox(height:30),





            Text(

              widget.brand,

              style:TextStyle(

                color:Colors.grey.shade600,

                fontSize:16,

              ),

            ),





            const SizedBox(height:5),





            Text(

              widget.name,

              style:const TextStyle(

                color:Colors.black,

                fontSize:30,

                fontWeight:FontWeight.bold,

              ),

            ),




            const SizedBox(height:10),





            Text(

              widget.price,

              style:const TextStyle(

                color:Colors.black,

                fontSize:22,

                fontWeight:FontWeight.bold,

              ),

            ),





            const SizedBox(height:30),






            const Text(

              "Description",

              style:TextStyle(

                fontSize:20,

                fontWeight:FontWeight.bold,

              ),

            ),





            const SizedBox(height:10),




            const Text(

              "A premium clothing item saved in your StyleSync wardrobe. Use your AI stylist to create outfits using this item.",

              style:TextStyle(

                color:Colors.black54,

                fontSize:16,

                height:1.5,

              ),

            ),





            const Spacer(),





            SizedBox(

              width:double.infinity,

              height:55,

              child:ElevatedButton(

                onPressed:addToCart,


                style:ElevatedButton.styleFrom(

                  backgroundColor:Colors.black,

                  shape:RoundedRectangleBorder(

                    borderRadius:

                    BorderRadius.circular(18),

                  ),

                ),



                child:const Text(

                  "Add To Cart",

                  style:TextStyle(

                    color:Colors.white,

                    fontSize:17,

                    fontWeight:FontWeight.bold,

                  ),

                ),



              ),

            ),





          ],


        ),


      ),


    );


  }


}