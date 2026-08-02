import 'package:flutter/material.dart';


class OutfitPage extends StatefulWidget {

  const OutfitPage({super.key});


  @override
  State<OutfitPage> createState() => _OutfitPageState();

}



class _OutfitPageState extends State<OutfitPage> {


  String selectedOccasion = "School";

  List<Map<String, dynamic>> outfitItems = [];


  @override
  void initState() {

    super.initState();

    outfitItems = _buildOutfitItems("School");

  }


  List<Map<String, dynamic>> _buildOutfitItems(String occasion) {

    switch (occasion) {

      case "Work":

        return [

          {"name": "Button Up Shirt", "image": "lib/images/tshirt.png"},

          {"name": "Dark Pants", "image": "lib/images/cargo.png"},

          {"name": "Loafers", "image": "lib/images/Jordan.png"},

        ];

      case "Gym":

        return [

          {"name": "Athletic Shirt", "image": "lib/images/tshirt.png"},

          {"name": "Joggers", "image": "lib/images/cargo.png"},

          {"name": "Training Shoes", "image": "lib/images/Jordan.png"},

        ];

      case "Date":

        return [

          {"name": "Black Jacket", "image": "lib/images/yellow.png"},

          {"name": "White Tee", "image": "lib/images/tshirt.png"},

          {"name": "Denim Jeans", "image": "lib/images/cargo.png"},

        ];

      case "School":

      default:

        return [

          {"name": "Grey Hoodie", "image": "lib/images/hoodie.png"},

          {"name": "Black Pants", "image": "lib/images/cargo.png"},

          {"name": "Clean Sneakers", "image": "lib/images/Jordan.png"},

        ];

    }

  }


  void generateOutfit(){


    setState((){

      outfitItems = _buildOutfitItems(selectedOccasion);

    });


  }





  void saveOutfit(){


    ScaffoldMessenger.of(context).showSnackBar(

      const SnackBar(

        content:Text(

          "Outfit saved!",

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

          "AI STYLIST",

          style:TextStyle(

            color:Colors.black,

            fontWeight:FontWeight.bold,

            letterSpacing:2,

          ),

        ),

      ),





      body:Padding(

        padding:const EdgeInsets.all(20),



        child:Column(

          crossAxisAlignment:

          CrossAxisAlignment.start,



          children:[



            const Text(

              "Create Your Outfit",

              style:TextStyle(

                fontSize:28,

                fontWeight:FontWeight.bold,

              ),

            ),





            const SizedBox(height:25),




            const Text(

              "Choose Occasion",

              style:TextStyle(

                fontSize:20,

                fontWeight:FontWeight.bold,

              ),

            ),





            const SizedBox(height:15),




            Wrap(

              spacing:10,

              children:[


                occasionButton("School"),

                occasionButton("Work"),

                occasionButton("Gym"),

                occasionButton("Date"),


              ],

            ),





            const SizedBox(height:35),





            Container(

              width:double.infinity,

              padding:

              const EdgeInsets.all(25),



              decoration:BoxDecoration(

                color:Colors.black,

                borderRadius:

                BorderRadius.circular(25),

              ),



              child:Column(

                children:[



                  const Icon(

                    Icons.auto_awesome,

                    color:Colors.white,

                    size:55,

                  ),




                  const SizedBox(height:15),




                  const Text(

                    "AI Recommendation",

                    style:TextStyle(

                      color:Colors.white,

                      fontSize:22,

                      fontWeight:FontWeight.bold,

                    ),

                  ),





                  const SizedBox(height:15),



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





            const Spacer(),




            SizedBox(

              width:double.infinity,

              height:55,


              child:ElevatedButton(

                onPressed:generateOutfit,


                style:ElevatedButton.styleFrom(

                  backgroundColor:Colors.black,

                  shape:RoundedRectangleBorder(

                    borderRadius:

                    BorderRadius.circular(18),

                  ),

                ),



                child:const Text(

                  "Generate Outfit",

                  style:TextStyle(

                    color:Colors.white,

                    fontSize:17,

                    fontWeight:FontWeight.bold,

                  ),

                ),

              ),

            ),





            const SizedBox(height:15),





            SizedBox(

              width:double.infinity,

              height:55,


              child:OutlinedButton(

                onPressed:saveOutfit,


                style:OutlinedButton.styleFrom(

                  side:const BorderSide(

                    color:Colors.black,

                  ),


                  shape:RoundedRectangleBorder(

                    borderRadius:

                    BorderRadius.circular(18),

                  ),

                ),



                child:const Text(

                  "Save Outfit",

                  style:TextStyle(

                    color:Colors.black,

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





  Widget occasionButton(String title){


    return ChoiceChip(

      label:Text(title),


      selected:selectedOccasion == title,


      onSelected:(value){


        setState((){


          selectedOccasion = title;


        });


      },


      selectedColor:Colors.black,


      labelStyle:TextStyle(

        color:selectedOccasion == title

            ? Colors.white

            : Colors.black,

      ),


    );


  }


}