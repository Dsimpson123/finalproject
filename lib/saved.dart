import 'package:flutter/material.dart';
import 'product.dart';


class SavedPage extends StatelessWidget {

  const SavedPage({super.key});


  @override
  Widget build(BuildContext context) {

    final textColor = Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;

    return Scaffold(

      backgroundColor: Theme.of(context).scaffoldBackgroundColor,


      appBar: AppBar(

        backgroundColor: Theme.of(context).scaffoldBackgroundColor,

        elevation: 0,


        title: Text(

          "SAVED",

          style: TextStyle(

            color: textColor,

            fontWeight: FontWeight.bold,

            letterSpacing: 2,

          ),

        ),


        actions: [

          IconButton(

            onPressed: () {},

            icon: const Icon(

              Icons.bookmark,

              color: Colors.black,

            ),

          ),

        ],

      ),




      body: SingleChildScrollView(

        padding: const EdgeInsets.all(18),


        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,


          children: [



            Text(

              "Saved Outfits",

              style: TextStyle(

                color: textColor,

                fontSize: 26,

                fontWeight: FontWeight.bold,

              ),

            ),




            const SizedBox(height:20),




            GridView.count(

              shrinkWrap:true,

              physics:

              const NeverScrollableScrollPhysics(),


              crossAxisCount:2,


              crossAxisSpacing:15,


              mainAxisSpacing:15,



              children: const [


                OutfitCard(

                  title:"Streetwear",

                  description:"Hoodie + Cargo",

                  icon:Icons.checkroom,

                ),



                OutfitCard(

                  title:"Minimal",

                  description:"Clean Style",

                  icon:Icons.style,

                ),



                OutfitCard(

                  title:"Winter",

                  description:"Layered Fit",

                  icon:Icons.ac_unit,

                ),



                OutfitCard(

                  title:"Daily",

                  description:"Everyday Wear",

                  icon:Icons.person,

                ),


              ],


            ),




            const SizedBox(height:35),





            const Text(

              "Saved Clothing",

              style:TextStyle(

                color:Colors.black,

                fontSize:26,

                fontWeight:FontWeight.bold,

              ),

            ),




            const SizedBox(height:20),




            const SavedProduct(

              brand:"Vision",

              name:"Oversized Hoodie",

              price:"\$85",

              icon:Icons.checkroom,

              image:"lib/images/hoodie.png",

            ),




            const SavedProduct(

              brand:"District",

              name:"Cargo Pants",

              price:"\$120",

              icon:Icons.straighten,

              image:"lib/images/cargo.png",

            ),




            const SavedProduct(

              brand:"Motion",

              name:"Jordan Sneakers",

              price:"\$150",

              icon:Icons.directions_run,

              image:"lib/images/Jordan.png",

            ),




            const SavedProduct(

              brand:"Essence",

              name:"Vintage Jacket",

              price:"\$200",

              icon:Icons.dry_cleaning,

              image:"lib/images/yellow.png",

            ),




            const SavedProduct(

              brand:"Vision",

              name:"Classic White Tee",

              price:"\$45",

              icon:Icons.checkroom,

              image:"lib/images/tshirt.png",

            ),



          ],


        ),


      ),


    );


  }

}







// ---------------- OUTFIT CARD ----------------


class OutfitCard extends StatelessWidget {


  final String title;

  final String description;

  final IconData icon;



  const OutfitCard({

    super.key,

    required this.title,

    required this.description,

    required this.icon,

  });



  @override
  Widget build(BuildContext context){


    return Container(

      padding:const EdgeInsets.all(15),


      decoration:BoxDecoration(

        color: Theme.of(context).brightness == Brightness.dark ? const Color(0xFF1A1A1A) : Colors.black,

        borderRadius:

        BorderRadius.circular(20),

      ),



      child:Column(

        mainAxisAlignment:

        MainAxisAlignment.center,


        children:[



          Icon(

            icon,

            color:Colors.white,

            size:50,

          ),




          const SizedBox(height:15),




          Text(

            title,

            textAlign:TextAlign.center,


            style:const TextStyle(

              color:Colors.white,

              fontSize:17,

              fontWeight:FontWeight.bold,

            ),

          ),





          const SizedBox(height:8),





          Text(

            description,

            textAlign:TextAlign.center,


            style:TextStyle(

              color:Colors.grey.shade400,

              fontSize:13,

            ),

          ),



        ],


      ),


    );


  }


}







// ---------------- SAVED PRODUCT ----------------


class SavedProduct extends StatelessWidget {


  final String brand;

  final String name;

  final String price;

  final IconData icon;

  final String image;



  const SavedProduct({

    super.key,

    required this.brand,

    required this.name,

    required this.price,

    required this.icon,

    required this.image,

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

        const EdgeInsets.only(bottom:15),



        padding:

        const EdgeInsets.all(15),



        decoration:BoxDecoration(

          color: Theme.of(context).brightness == Brightness.dark ? const Color(0xFF1A1A1A) : Colors.black,

          borderRadius:

          BorderRadius.circular(20),

        ),




        child:Row(

          children:[



            Container(

              height:85,

              width:85,


              decoration:BoxDecoration(

                color:Colors.white,

                borderRadius:

                BorderRadius.circular(15),

              ),



              child:ClipRRect(

                borderRadius:BorderRadius.circular(15),

                child:Image.asset(

                  image,

                  fit:BoxFit.cover,

                  width:double.infinity,

                  height:double.infinity,

                  errorBuilder:(context, error, stackTrace) {

                    return Icon(

                      icon,

                      color:Colors.black,

                      size:55,

                    );

                  },

                ),

              ),


            ),




            const SizedBox(width:20),




            Expanded(

              child:Column(

                crossAxisAlignment:

                CrossAxisAlignment.start,


                children:[



                  Text(

                    brand,

                    style:TextStyle(

                      color:Colors.grey.shade400,

                    ),

                  ),




                  Text(

                    name,

                    style:const TextStyle(

                      color:Colors.white,

                      fontSize:18,

                      fontWeight:FontWeight.bold,

                    ),

                  ),





                  Text(

                    price,

                    style:const TextStyle(

                      color:Colors.white,

                      fontSize:16,

                    ),

                  ),



                ],


              ),


            ),




            const Icon(

              Icons.favorite,

              color:Colors.white,

            ),



          ],


        ),


      ),


    );


  }


}