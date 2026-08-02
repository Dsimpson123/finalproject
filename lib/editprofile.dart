import 'package:flutter/material.dart';


class EditProfilePage extends StatefulWidget {

  final String currentName;

  final String currentUsername;


  const EditProfilePage({

    super.key,

    required this.currentName,

    required this.currentUsername,

  });



  @override
  State<EditProfilePage> createState() => _EditProfilePageState();

}




class _EditProfilePageState extends State<EditProfilePage> {


  late TextEditingController nameController;

  late TextEditingController usernameController;




  @override
  void initState(){

    super.initState();


    nameController = TextEditingController(

      text: widget.currentName,

    );


    usernameController = TextEditingController(

      text: widget.currentUsername,

    );


  }





  @override
  void dispose(){


    nameController.dispose();

    usernameController.dispose();


    super.dispose();


  }





  void saveProfile(){


    Navigator.pop(

      context,

      {

        "name": nameController.text,

        "username": usernameController.text,


      },


    );


  }





  @override
  Widget build(BuildContext context){


    return Scaffold(

      backgroundColor:Colors.white,



      appBar:AppBar(

        backgroundColor:Colors.white,

        elevation:0,


        iconTheme:const IconThemeData(

          color:Colors.black,

        ),



        title:const Text(

          "EDIT PROFILE",

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

          children:[




            const CircleAvatar(

              radius:55,

              backgroundColor:Colors.black,

              child:Icon(

                Icons.person,

                size:65,

                color:Colors.white,

              ),

            ),





            const SizedBox(height:30),





            TextField(

              controller:nameController,


              decoration:InputDecoration(

                labelText:"Name",

                prefixIcon:const Icon(

                  Icons.person,

                ),


                border:OutlineInputBorder(

                  borderRadius:

                  BorderRadius.circular(15),

                ),

              ),

            ),





            const SizedBox(height:20),





            TextField(

              controller:usernameController,


              decoration:InputDecoration(

                labelText:"Username",


                prefixIcon:const Icon(

                  Icons.alternate_email,

                ),



                border:OutlineInputBorder(

                  borderRadius:

                  BorderRadius.circular(15),

                ),

              ),


            ),





            const SizedBox(height:35),





            SizedBox(

              width:double.infinity,

              height:55,



              child:ElevatedButton(

                onPressed:saveProfile,


                style:ElevatedButton.styleFrom(

                  backgroundColor:Colors.black,


                  shape:RoundedRectangleBorder(

                    borderRadius:

                    BorderRadius.circular(18),

                  ),

                ),



                child:const Text(

                  "Save Changes",

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