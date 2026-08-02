import 'package:flutter/material.dart';
import 'models/outfit.dart';

class HomePage extends StatelessWidget {

  final String userName;

  const HomePage({super.key, this.userName = "Darren"});


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(

        backgroundColor: Colors.white,

        elevation: 0,

        title: const Text(

          "StyleSync",

          style: TextStyle(

            color: Colors.black,

            fontSize: 26,

            fontWeight: FontWeight.bold,

          ),

        ),

      ),


      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text(

              "Good Morning",

              style: TextStyle(

                color: Colors.grey,

                fontSize: 18,

              ),

            ),


            Text(

              userName,

              style: const TextStyle(

                color: Colors.black,

                fontSize: 32,

                fontWeight: FontWeight.bold,

              ),

            ),


            const SizedBox(height: 30),


            Container(

              width: double.infinity,

              padding: const EdgeInsets.all(22),

              decoration: BoxDecoration(

                color: Colors.black,

                borderRadius: BorderRadius.circular(25),

              ),


              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  const Icon(

                    Icons.auto_awesome,

                    color: Colors.white,

                    size: 50,

                  ),


                  const SizedBox(height: 15),


                  const Text(

                    "Create your outfit with AI",

                    style: TextStyle(

                      color: Colors.white,

                      fontSize: 22,

                      fontWeight: FontWeight.bold,

                    ),

                  ),


                  const SizedBox(height: 10),


                  const Text(

                    "Let your AI stylist choose the perfect look.",

                    style: TextStyle(

                      color: Colors.white70,

                      fontSize: 15,

                    ),

                  ),


                  const SizedBox(height: 20),


                  ElevatedButton(

                    onPressed: () {

                      Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (context) => const OutfitPage(),

                        ),

                      );

                    },


                    style: ElevatedButton.styleFrom(

                      backgroundColor: Colors.white,

                      foregroundColor: Colors.black,

                      padding: const EdgeInsets.symmetric(

                        horizontal: 25,

                        vertical: 14,

                      ),

                      shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(30),

                      ),

                    ),


                    child: const Text(

                      "Create Outfit",

                      style: TextStyle(

                        fontWeight: FontWeight.bold,

                      ),

                    ),

                  ),

                ],

              ),

            ),


            const SizedBox(height: 35),


            const Text(

              "Choose Occasion",

              style: TextStyle(

                color: Colors.black,

                fontSize: 25,

                fontWeight: FontWeight.bold,

              ),

            ),


            const SizedBox(height: 15),


            Wrap(

              spacing: 12,

              runSpacing: 12,

              children: const [

                OccasionButton(

                  icon: Icons.school,

                  title: "School",

                ),


                OccasionButton(

                  icon: Icons.work,

                  title: "Work",

                ),


                OccasionButton(

                  icon: Icons.favorite,

                  title: "Date",

                ),


                OccasionButton(

                  icon: Icons.fitness_center,

                  title: "Gym",

                ),

              ],

            ),


            const SizedBox(height: 35),


            const Text(

              "Today's Recommendation",

              style: TextStyle(

                fontSize: 25,

                fontWeight: FontWeight.bold,

              ),

            ),


            const SizedBox(height: 15),


            Container(

              width: double.infinity,

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(

                color: Colors.black,

                borderRadius: BorderRadius.circular(25),

              ),


              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  const Icon(

                    Icons.checkroom,

                    color: Colors.white,

                    size: 65,

                  ),


                  const SizedBox(height: 15),


                  const Text(

                    "Streetwear Fit",

                    style: TextStyle(

                      color: Colors.white,

                      fontSize: 22,

                      fontWeight: FontWeight.bold,

                    ),

                  ),


                  const SizedBox(height: 10),


                  const Text(

                    "Hoodie\nCargo Pants\nSneakers",

                    style: TextStyle(

                      color: Colors.white,

                      fontSize: 17,

                    ),

                  ),

                ],

              ),

            ),

          ],

        ),

      ),

    );

  }

}



class OccasionButton extends StatelessWidget {

  final IconData icon;

  final String title;


  const OccasionButton({

    super.key,

    required this.icon,

    required this.title,

  });


  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.symmetric(

        horizontal: 18,

        vertical: 12,

      ),


      decoration: BoxDecoration(

        color: Colors.black,

        borderRadius: BorderRadius.circular(30),

      ),


      child: Row(

        mainAxisSize: MainAxisSize.min,

        children: [

          Icon(

            icon,

            color: Colors.white,

            size: 18,

          ),


          const SizedBox(width: 8),


          Text(

            title,

            style: const TextStyle(

              color: Colors.white,

              fontWeight: FontWeight.bold,

            ),

          ),

        ],

      ),

    );

  }

}