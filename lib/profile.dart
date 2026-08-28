import 'package:flutter/material.dart';
import 'models/outfit.dart';
import 'shopping.dart';
import 'saved.dart';
import 'app_state.dart';

class ProfilePage extends StatefulWidget {

  const ProfilePage({super.key});


  @override
  State<ProfilePage> createState() => _ProfilePageState();

}



class _ProfilePageState extends State<ProfilePage> {


  String name = "Darren";

  String username = "@styleai_user";

  bool get isPrivateAccount => AppSettings.privateAccountEnabled.value;



  @override
  Widget build(BuildContext context) {

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;

    return Scaffold(

      backgroundColor: Theme.of(context).scaffoldBackgroundColor,


      appBar: AppBar(

        backgroundColor: Colors.white,

        elevation: 0,


        title: Text(

          "PROFILE",

          style: TextStyle(

            color: textColor,

            fontWeight: FontWeight.bold,

            letterSpacing: 2,

          ),

        ),


        actions: [

          IconButton(

            onPressed: () {

              Navigator.push(

                context,

                MaterialPageRoute(

                  builder: (context) => const SettingsPage(),

                ),

              );

            },

            icon: Icon(

              Icons.settings_outlined,

              color: textColor,

            ),

          ),

        ],

      ),



      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),


        child: Column(

          crossAxisAlignment: CrossAxisAlignment.center,


          children: [



            CircleAvatar(

              radius: 55,

              backgroundColor: isDark ? Colors.white : Colors.black,

              child: Icon(

                Icons.person,

                size:65,

                color: isDark ? Colors.black : Colors.white,

              ),

            ),



            const SizedBox(height:15),




            Text(

              name,

              style: TextStyle(

                color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,

                fontSize:30,

                fontWeight:FontWeight.bold,

              ),

            ),



            const SizedBox(height:5),




            if (isPrivateAccount)

              Container(

                margin: const EdgeInsets.only(top: 8),

                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),

                decoration: BoxDecoration(

                  color: isDark ? const Color(0xFF1A1A1A) : Colors.black,

                  borderRadius: BorderRadius.circular(20),

                ),

                child: const Text(

                  "Private account",

                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),

                ),

              ),


            Text(

              username,

              style:TextStyle(

                color:Colors.grey.shade600,

                fontSize:16,

              ),

            ),



            const SizedBox(height:25),




            SizedBox(

              width:double.infinity,

              height:55,


              child:ElevatedButton(

                onPressed:() async {


                  final result = await Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder:(context)=>EditProfilePage(

                        initialName:name,

                        initialUsername:username,

                      ),

                    ),

                  );



                  if(result != null){

                    setState((){

                      name = result["name"];

                      username = result["username"];

                    });

                  }


                },


                style:ElevatedButton.styleFrom(

                  backgroundColor: isDark ? Colors.white : Colors.black,

                  shape:RoundedRectangleBorder(

                    borderRadius:BorderRadius.circular(18),

                  ),

                ),



                child: Text(

                  "Edit Profile",

                  style:TextStyle(

                    color: isDark ? Colors.black : Colors.white,

                    fontSize:17,

                    fontWeight:FontWeight.bold,

                  ),

                ),

              ),

            ),



            const SizedBox(height:35),
                        const Row(

              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [

                ProfileStat(
                  number:"42",
                  title:"Clothes",
                ),

                ProfileStat(
                  number:"18",
                  title:"Outfits",
                ),

                ProfileStat(
                  number:"6",
                  title:"Brands",
                ),

              ],

            ),



            const SizedBox(height:35),




            Align(

              alignment:Alignment.centerLeft,

              child:Text(

                "Style Preferences",

                style:TextStyle(

                  color: textColor,

                  fontSize:25,

                  fontWeight:FontWeight.bold,

                ),

              ),

            ),




            const SizedBox(height:15),




            const Wrap(

              spacing:12,

              runSpacing:12,

              children:[

                StyleTag(text:"Streetwear"),

                StyleTag(text:"Minimal"),

                StyleTag(text:"Luxury"),

                StyleTag(text:"Vintage"),

              ],

            ),




            const SizedBox(height:35),




            Align(

              alignment:Alignment.centerLeft,

              child:Text(

                "AI Style Settings",

                style:TextStyle(

                  color:textColor,

                  fontSize:25,

                  fontWeight:FontWeight.bold,

                ),

              ),

            ),




            const SizedBox(height:15),




            ProfileOption(

              icon:Icons.wb_sunny_outlined,

              title:"Weather Based Outfits",

              onTap:(){

                Navigator.push(

                  context,

                  MaterialPageRoute(

                    builder:(context)=>const OutfitPage(),

                  ),

                );

              },

            ),




            ProfileOption(

              icon:Icons.school_outlined,

              title:"School Outfit Suggestions",

              onTap:(){

                Navigator.push(

                  context,

                  MaterialPageRoute(

                    builder:(context)=>const OutfitPage(),

                  ),

                );

              },

            ),




            ProfileOption(

              icon:Icons.favorite_outline,

              title:"Saved Outfits",

              onTap:(){

                Navigator.push(

                  context,

                  MaterialPageRoute(

                    builder:(context)=>const SavedPage(),

                  ),

                );

              },

            ),




            ProfileOption(

              icon:Icons.shopping_bag_outlined,

              title:"Shopping Recommendations",

              onTap:(){

                Navigator.push(

                  context,

                  MaterialPageRoute(

                    builder:(context)=>const ShoppingPage(),

                  ),

                );

              },

            ),




            const SizedBox(height:35),




            Container(

              width:double.infinity,

              padding:const EdgeInsets.all(20),


              decoration:BoxDecoration(

                color: isDark ? const Color(0xFF1A1A1A) : Colors.black,

                borderRadius:BorderRadius.circular(22),

              ),



              child:Column(

                children:[


                  const Icon(

                    Icons.auto_awesome,

                    color:Colors.white,

                    size:40,

                  ),



                  const SizedBox(height:10),




                  const Text(

                    "Your AI Stylist",

                    style:TextStyle(

                      color:Colors.white,

                      fontSize:22,

                      fontWeight:FontWeight.bold,

                    ),

                  ),




                  const SizedBox(height:10),




                  Text(

                    "STYLE AI learns your wardrobe and creates personalized outfits based on your clothing and favorite styles.",

                    textAlign:TextAlign.center,

                    style:TextStyle(

                      color:Colors.grey.shade400,

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

// ---------------- PROFILE STAT ----------------


class ProfileStat extends StatelessWidget {

  final String number;

  final String title;


  const ProfileStat({

    super.key,

    required this.number,

    required this.title,

  });



  @override
  Widget build(BuildContext context) {


    return Column(

      children:[


        Text(

          number,

          style:const TextStyle(

            color:Colors.black,

            fontSize:26,

            fontWeight:FontWeight.bold,

          ),

        ),



        const SizedBox(height:5),




        Text(

          title,

          style:TextStyle(

            color:Colors.grey.shade600,

            fontSize:15,

          ),

        ),



      ],

    );


  }

}





// ---------------- STYLE TAG ----------------


class StyleTag extends StatelessWidget {


  final String text;



  const StyleTag({

    super.key,

    required this.text,

  });



  @override
  Widget build(BuildContext context){


    return Container(

      padding:const EdgeInsets.symmetric(

        horizontal:18,

        vertical:12,

      ),



      decoration:BoxDecoration(

        color: Theme.of(context).brightness == Brightness.dark ? const Color(0xFF1A1A1A) : Colors.black,

        borderRadius:BorderRadius.circular(30),

      ),



      child:Text(

        text,

        style:const TextStyle(

          color:Colors.white,

          fontWeight:FontWeight.bold,

        ),

      ),

    );


  }

}





// ---------------- CLICKABLE PROFILE OPTION ----------------


class ProfileOption extends StatelessWidget {


  final IconData icon;

  final String title;

  final VoidCallback onTap;



  const ProfileOption({

    super.key,

    required this.icon,

    required this.title,

    required this.onTap,

  });



  @override
  Widget build(BuildContext context){


    return GestureDetector(

      onTap:onTap,


      child:Container(

        margin:const EdgeInsets.only(bottom:15),

        padding:const EdgeInsets.all(18),


        decoration:BoxDecoration(

          color: Theme.of(context).brightness == Brightness.dark ? const Color(0xFF1A1A1A) : Colors.black,

          borderRadius:BorderRadius.circular(18),

        ),



        child:Row(

          children:[


            Icon(

              icon,

              color:Colors.white,

            ),



            const SizedBox(width:18),




            Expanded(

              child:Text(

                title,

                style:const TextStyle(

                  color:Colors.white,

                  fontSize:17,

                  fontWeight:FontWeight.bold,

                ),

              ),

            ),




            const Icon(

              Icons.arrow_forward_ios,

              color:Colors.white,

              size:16,

            ),


          ],

        ),

      ),

    );


  }

}

// ---------------- SETTINGS PAGE ----------------


class SettingsPage extends StatefulWidget {

  const SettingsPage({super.key});


  @override
  State<SettingsPage> createState() => _SettingsPageState();

}


class _SettingsPageState extends State<SettingsPage> {

  bool notificationsEnabled = true;

  bool darkModeEnabled = AppSettings.darkModeEnabled.value;

  bool recommendationsEnabled = true;

  bool privateAccountEnabled = AppSettings.privateAccountEnabled.value;


  @override
  Widget build(BuildContext context) {

    final textColor = Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black;

    return Scaffold(

      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      appBar: AppBar(

        backgroundColor: Colors.white,

        elevation: 0,

        iconTheme: IconThemeData(color: textColor),

        title: Text(

          "SETTINGS",

          style: TextStyle(

            color: textColor,

            fontWeight: FontWeight.bold,

            letterSpacing: 2,

          ),

        ),

      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: ListView(

          children: [

            Text(

              "Manage your app preferences",

              style: TextStyle(

                color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,

                fontSize: 22,

                fontWeight: FontWeight.bold,

              ),

            ),

            const SizedBox(height: 20),

            SwitchListTile(

              activeThumbColor: Colors.black,

              title: const Text("Notifications"),

              subtitle: const Text("Get updates about new outfits and deals"),

              value: notificationsEnabled,

              onChanged: (value) {

                setState(() {

                  notificationsEnabled = value;

                });

              },

            ),

            SwitchListTile(

              activeThumbColor: Colors.black,

              title: const Text("Dark Mode"),

              subtitle: const Text("Use a darker theme throughout the app"),

              value: darkModeEnabled,

              onChanged: (value) {

                setState(() {

                  darkModeEnabled = value;

                  AppSettings.setDarkMode(value);

                });

              },

            ),

            SwitchListTile(

              activeThumbColor: Colors.black,

              title: const Text("Recommendations"),

              subtitle: const Text("Show personalized outfit suggestions"),

              value: recommendationsEnabled,

              onChanged: (value) {

                setState(() {

                  recommendationsEnabled = value;

                });

              },

            ),

            SwitchListTile(

              activeThumbColor: Colors.black,

              title: const Text("Private Account"),

              subtitle: const Text("Limit who can see your profile activity"),

              value: privateAccountEnabled,

              onChanged: (value) {

                setState(() {

                  privateAccountEnabled = value;

                  AppSettings.setPrivateAccount(value);

                });

              },

            ),

            const SizedBox(height: 30),

            SizedBox(

              height: 55,

              child: ElevatedButton(

                onPressed: () {

                  ScaffoldMessenger.of(context).showSnackBar(

                    SnackBar(

                      content: Text(

                        privateAccountEnabled

                            ? "Private account enabled"

                            : "Private account disabled",

                      ),

                      backgroundColor: Colors.black,

                    ),

                  );

                  Navigator.pop(context);

                },

                style: ElevatedButton.styleFrom(

                  backgroundColor: Colors.black,

                  shape: RoundedRectangleBorder(

                    borderRadius: BorderRadius.circular(18),

                  ),

                ),

                child: const Text(

                  "Save Settings",

                  style: TextStyle(

                    color: Colors.white,

                    fontSize: 17,

                    fontWeight: FontWeight.bold,

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

// ---------------- EDIT PROFILE PAGE ----------------


class EditProfilePage extends StatefulWidget {


  final String initialName;

  final String initialUsername;



  const EditProfilePage({

    super.key,

    required this.initialName,

    required this.initialUsername,

  });



  @override
  State<EditProfilePage> createState() => _EditProfilePageState();


}




class _EditProfilePageState extends State<EditProfilePage>{


  late TextEditingController nameController;

  late TextEditingController usernameController;



  @override
  void initState(){

    super.initState();


    nameController = TextEditingController(

      text:widget.initialName,

    );


    usernameController = TextEditingController(

      text:widget.initialUsername,

    );


  }




  @override
  void dispose(){


    nameController.dispose();

    usernameController.dispose();


    super.dispose();


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

                border:OutlineInputBorder(

                  borderRadius:BorderRadius.circular(15),

                ),

              ),

            ),




            const SizedBox(height:20),





            TextField(

              controller:usernameController,


              decoration:InputDecoration(

                labelText:"Username",

                border:OutlineInputBorder(

                  borderRadius:BorderRadius.circular(15),

                ),

              ),

            ),





            const SizedBox(height:30),






            SizedBox(

              width:double.infinity,

              height:55,



              child:ElevatedButton(


                onPressed:(){



                  Navigator.pop(

                    context,

                    {


                      "name":nameController.text,


                      "username":usernameController.text,


                    },


                  );



                },



                style:ElevatedButton.styleFrom(


                  backgroundColor:Colors.black,


                  shape:RoundedRectangleBorder(


                    borderRadius:BorderRadius.circular(18),


                  ),


                ),



                child: const Text(

                  "Save Changes",

                  style: TextStyle(

                    color: Colors.white,

                    fontSize: 17,

                    fontWeight: FontWeight.bold,

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