import 'package:flutter/material.dart';
import 'product.dart';


class ShopPage extends StatelessWidget {

  const ShopPage({super.key});


  @override
  Widget build(BuildContext context) {


    return Scaffold(

      backgroundColor: Colors.white,


      appBar: AppBar(

        backgroundColor: Colors.white,

        elevation:0,


        title: const Text(

          "SHOP",

          style: TextStyle(

            color: Colors.black,

            fontWeight: FontWeight.bold,

            letterSpacing:2,

          ),

        ),


        actions:[

          IconButton(

            onPressed:(){},

            icon:const Icon(

              Icons.shopping_cart_outlined,

              color:Colors.black,

            ),

          )

        ],


      ),



      body:SingleChildScrollView(

        padding:const EdgeInsets.all(18),


        child:Column(

          crossAxisAlignment:CrossAxisAlignment.start,


          children:[



            Container(

              height:55,


              decoration:BoxDecoration(

                color:Colors.black,

                borderRadius:
                BorderRadius.circular(15),

              ),



              child:const TextField(

                style:TextStyle(
                  color:Colors.white,
                ),

                decoration:InputDecoration(

                  hintText:
                  "Search clothes...",

                  hintStyle:
                  TextStyle(
                    color:Colors.grey,
                  ),

                  prefixIcon:
                  Icon(
                    Icons.search,
                    color:Colors.white,
                  ),

                  border:InputBorder.none,

                ),

              ),

            ),




            const SizedBox(height:30),




            const Text(

              "Recommended For You",

              style:TextStyle(

                color:Colors.black,

                fontSize:25,

                fontWeight:FontWeight.bold,

              ),

            ),




            const SizedBox(height:20),




            GridView.count(

              shrinkWrap:true,

              physics:
              const NeverScrollableScrollPhysics(),


              crossAxisCount:2,


              children:[



                ShopProductCard(

                  brand:"Vision",

                  name:"Oversized Hoodie",

                  price:"\$85",

                ),



                ShopProductCard(

                  brand:"District",

                  name:"Cargo Pants",

                  price:"\$120",

                ),



                ShopProductCard(

                  brand:"Motion",

                  name:"Sneakers",

                  price:"\$150",

                ),



                ShopProductCard(

                  brand:"Essence",

                  name:"Basic Tee",

                  price:"\$45",

                ),



              ],


            )


          ],


        ),


      ),

    );


  }

}





class ShopProductCard extends StatelessWidget {


final String brand;

final String name;

final String price;



const ShopProductCard({

super.key,

required this.brand,

required this.name,

required this.price,

});



@override
Widget build(BuildContext context){


return GestureDetector(

onTap:(){


Navigator.push(

context,

MaterialPageRoute(

builder:(context)=>ProductPage(

brand:brand,

name:name,

price:price,

),

),

);


},



child:Container(

margin:
const EdgeInsets.all(8),



decoration:BoxDecoration(

color:Colors.black,

borderRadius:
BorderRadius.circular(18),

),



child:Column(

mainAxisAlignment:
MainAxisAlignment.center,


children:[



const Icon(

Icons.checkroom,

color:Colors.white,

size:60,

),



const SizedBox(height:15),




Text(

brand,

style:
const TextStyle(

color:Colors.grey,

),

),




Text(

name,

textAlign:
TextAlign.center,


style:
const TextStyle(

color:Colors.white,

fontWeight:
FontWeight.bold,

),

),




Text(

price,

style:
const TextStyle(

color:Colors.white,

fontSize:18,

fontWeight:
FontWeight.bold,

),

),



],

),


),


);


}


}