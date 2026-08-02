import 'package:flutter/material.dart';


class StylistPage extends StatefulWidget {

  const StylistPage({super.key});


  @override
  State<StylistPage> createState() => _StylistPageState();

}



class _StylistPageState extends State<StylistPage> {


  List<Map<String, dynamic>> outfitItems = [

    {"name": "Grey Hoodie", "image": "lib/images/hoodie.png"},

    {"name": "Black Pants", "image": "lib/images/cargo.png"},

    {"name": "Clean Sneakers", "image": "lib/images/Jordan.png"},

  ];

  IconData outfitIcon = Icons.auto_awesome;



  void generateOutfit(String occasion){


    setState(() {


      if(occasion == "School"){


        outfitItems = [

          {"name": "Grey Hoodie", "image": "lib/images/hoodie.png"},

          {"name": "Black Pants", "image": "lib/images/cargo.png"},

          {"name": "Clean Sneakers", "image": "lib/images/Jordan.png"},

        ];

        outfitIcon = Icons.school;


      }


      else if(occasion == "Gym"){


        outfitItems = [

          {"name": "Athletic Shirt", "image": "lib/images/tshirt.png"},

          {"name": "Joggers", "image": "lib/images/cargo.png"},

          {"name": "Training Shoes", "image": "lib/images/Jordan.png"},

        ];

        outfitIcon = Icons.fitness_center;


      }


      else if(occasion == "Date"){


        outfitItems = [

          {"name": "Black Jacket", "image": "lib/images/yellow.png"},

          {"name": "White Tee", "image": "lib/images/tshirt.png"},

          {"name": "Denim Jeans", "image": "lib/images/cargo.png"},

        ];

        outfitIcon = Icons.favorite;


      }


      else{


        outfitItems = [

          {"name": "Neutral Colors", "image": "lib/images/hoodie.png"},

          {"name": "Relaxed Fit", "image": "lib/images/cargo.png"},

          {"name": "Simple Accessories", "image": "lib/images/Jordan.png"},

        ];

        outfitIcon = Icons.style;


      }



    });


  }





  @override
  Widget build(BuildContext context){


    return Scaffold(

      backgroundColor:Colors.white,


      appBar:AppBar(

        backgroundColor:Colors.white,

        elevation:0,


        title:const Text(

          "AI STYLIST",

          style:TextStyle(

            color:Colors.black,

            fontWeight:FontWeight.bold,

            letterSpacing:2,

          ),

        ),

      ),





      body:SingleChildScrollView(


        padding:const EdgeInsets.all(20),



        child:Column(

          crossAxisAlignment:

          CrossAxisAlignment.start,



          children:[



            const Text(

              "What are you dressing for?",

              style:TextStyle(

                color:Colors.black,

                fontSize:28,

                fontWeight:FontWeight.bold,

              ),

            ),



            const SizedBox(height:25),




            Wrap(

              spacing:12,

              runSpacing:12,


              children:[



                StyleButton(

                  title:"School",

                  icon:Icons.school,

                  onTap:(){

                    generateOutfit("School");

                  },

                ),




                StyleButton(

                  title:"Gym",

                  icon:Icons.fitness_center,

                  onTap:(){

                    generateOutfit("Gym");

                  },

                ),




                StyleButton(

                  title:"Date",

                  icon:Icons.favorite,

                  onTap:(){

                    generateOutfit("Date");

                  },

                ),




                StyleButton(

                  title:"Everyday",

                  icon:Icons.person,

                  onTap:(){

                    generateOutfit("Everyday");

                  },

                ),


              ],


            ),





            const SizedBox(height:40),





            Container(

              width:double.infinity,

              padding:const EdgeInsets.all(25),


              decoration:BoxDecoration(

                color:Colors.black,

                borderRadius:

                BorderRadius.circular(25),

              ),



              child:Column(


                children:[



                  Icon(

                    outfitIcon,

                    color:Colors.white,

                    size:70,

                  ),




                  const SizedBox(height:20),




                  const Text(

                    "AI Recommendation",

                    style:TextStyle(

                      color:Colors.white,

                      fontSize:22,

                      fontWeight:FontWeight.bold,

                    ),

                  ),





                  const SizedBox(height:20),



                  GridView.builder(

                    shrinkWrap: true,

                    physics: const NeverScrollableScrollPhysics(),

                    itemCount: outfitItems.length,

                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(

                      crossAxisCount: 3,

                      crossAxisSpacing: 10,

                      mainAxisSpacing: 10,

                      childAspectRatio: 0.8,

                    ),

                    itemBuilder: (context, index) {

                      final item = outfitItems[index];

                      return Container(

                        padding: const EdgeInsets.all(8),

                        decoration: BoxDecoration(

                          color: Colors.white,

                          borderRadius: BorderRadius.circular(16),

                        ),

                        child: Column(

                          children: [

                            Expanded(

                              child: ClipRRect(

                                borderRadius: BorderRadius.circular(12),

                                child: Image.asset(

                                  item["image"],

                                  fit: BoxFit.cover,

                                  width: double.infinity,

                                  errorBuilder: (context, error, stackTrace) {

                                    return const Icon(Icons.checkroom, size: 40, color: Colors.black);

                                  },

                                ),

                              ),

                            ),

                            const SizedBox(height: 8),

                            Text(

                              item["name"],

                              textAlign: TextAlign.center,

                              style: const TextStyle(

                                color: Colors.black,

                                fontSize: 12,

                                fontWeight: FontWeight.bold,

                              ),

                            ),

                          ],

                        ),

                      );

                    },

                  ),



                ],


              ),


            ),





            const SizedBox(height:35),





            SizedBox(

              width:double.infinity,


              height:55,



              child:ElevatedButton(

                onPressed:(){


                  ScaffoldMessenger.of(context).showSnackBar(

                    const SnackBar(

                      content:Text(

                        "Outfit saved!"

                      ),

                    ),

                  );


                },



                style:ElevatedButton.styleFrom(

                  backgroundColor:Colors.black,

                  shape:RoundedRectangleBorder(

                    borderRadius:

                    BorderRadius.circular(18),

                  ),

                ),



                child:const Text(

                  "Save Outfit",

                  style:TextStyle(

                    color:Colors.white,

                    fontWeight:FontWeight.bold,

                    fontSize:17,

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






class StyleButton extends StatelessWidget {


  final String title;

  final IconData icon;

  final VoidCallback onTap;



  const StyleButton({

    super.key,

    required this.title,

    required this.icon,

    required this.onTap,

  });




  @override
  Widget build(BuildContext context){


    return GestureDetector(

      onTap:onTap,


      child:Container(

        padding:

        const EdgeInsets.symmetric(

          horizontal:18,

          vertical:12,

        ),



        decoration:BoxDecoration(

          color:Colors.black,

          borderRadius:

          BorderRadius.circular(30),

        ),



        child:Row(

          mainAxisSize:MainAxisSize.min,


          children:[



            Icon(

              icon,

              color:Colors.white,

              size:18,

            ),




            const SizedBox(width:8),




            Text(

              title,

              style:const TextStyle(

                color:Colors.white,

                fontWeight:FontWeight.bold,

              ),

            ),



          ],

        ),

      ),

    );


  }


}