import 'package:flutter/material.dart';


class StoragePage extends StatefulWidget {

  const StoragePage({super.key});


  @override
  State<StoragePage> createState() => _StoragePageState();

}



class _StoragePageState extends State<StoragePage> {


  List<ClothingItem> closet = [

    ClothingItem(
      name: "Oversized Hoodie",
      category: "Hoodies",
      image: "lib/images/tshirt.png",
    ),


    ClothingItem(
      name: "Cargo Pants",
      category: "Pants",
      image: "lib/images/yellow.png",
    ),


    ClothingItem(
      name: "Jordan Sneakers",
      category: "Shoes",
      image: "lib/images/Jordan.png",
    ),


    ClothingItem(
      name: "White T-Shirt",
      category: "Shirts",
      image: "lib/images/tshirt.png",
    ),

  ];



  void addClothing(){

    setState(() {

      closet.add(

        ClothingItem(

          name: "New Clothing",

          category: "Other",

          image: "lib/images/yellow.png",

        ),

      );

    });

  }




  @override
  Widget build(BuildContext context) {


    return Scaffold(

      backgroundColor: Colors.white,


      appBar: AppBar(

        backgroundColor: Colors.white,

        elevation: 0,


        title: const Text(

          "MY STORAGE",

          style: TextStyle(

            color: Colors.black,

            fontWeight: FontWeight.bold,

            letterSpacing: 2,

          ),

        ),


        actions: [


          IconButton(

            onPressed: addClothing,


            icon: const Icon(

              Icons.add,

              color: Colors.black,

            ),

          ),

        ],

      ),




      body: Padding(

        padding: const EdgeInsets.all(18),


        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,


          children: [


            const Text(

              "Your Wardrobe",

              style: TextStyle(

                fontSize: 28,

                fontWeight: FontWeight.bold,

                color: Colors.black,

              ),

            ),



            const SizedBox(height:20),



            Expanded(

              child: GridView.builder(

                itemCount: closet.length,


                gridDelegate:

                const SliverGridDelegateWithFixedCrossAxisCount(

                  crossAxisCount: 2,

                  crossAxisSpacing: 15,

                  mainAxisSpacing: 15,

                  childAspectRatio: .65,

                ),



                itemBuilder: (context,index){


                  final item = closet[index];



                  return Container(

                    padding: const EdgeInsets.all(12),


                    decoration: BoxDecoration(

                      color: Colors.black,

                      borderRadius: BorderRadius.circular(20),

                    ),



                    child: Column(

                      crossAxisAlignment:

                      CrossAxisAlignment.start,


                      children: [



                        Expanded(

                          child: Container(

                            width: double.infinity,


                            decoration: BoxDecoration(

                              color: Colors.white,

                              borderRadius:

                              BorderRadius.circular(15),

                            ),



                            child: ClipRRect(

                              borderRadius:

                              BorderRadius.circular(15),



                              child: Image.asset(

                                item.image,

                                fit: BoxFit.cover,

                                errorBuilder:

                                (context, error, stackTrace) {

                                  return const Icon(

                                    Icons.checkroom,

                                    size:60,

                                    color:Colors.black,

                                  );

                                },

                              ),

                            ),

                          ),

                        ),




                        const SizedBox(height:10),




                        Text(

                          item.name,


                          maxLines: 1,

                          overflow:

                          TextOverflow.ellipsis,


                          style: const TextStyle(

                            color: Colors.white,

                            fontSize:17,

                            fontWeight:FontWeight.bold,

                          ),

                        ),




                        Text(

                          item.category,


                          style: TextStyle(

                            color: Colors.grey.shade400,

                            fontSize:14,

                          ),

                        ),


                      ],


                    ),

                  );


                },


              ),

            ),


          ],

        ),

      ),

    );


  }

}




// CLOTHING MODEL

class ClothingItem {


  final String name;

  final String category;

  final String image;



  ClothingItem({

    required this.name,

    required this.category,

    required this.image,

  });


}