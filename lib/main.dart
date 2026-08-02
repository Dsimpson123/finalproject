import 'package:flutter/material.dart';
import 'home.dart';
import 'closet.dart';
import 'stylist.dart';
import 'saved.dart';
import 'profile.dart';
import 'app_state.dart';
import 'login.dart';
import 'signup.dart';



void main() {
  runApp(const StyleSyncApp());
}


class StyleSyncApp extends StatelessWidget {

  const StyleSyncApp({super.key});


  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder<bool>(

      valueListenable: AppSettings.darkModeEnabled,

      builder: (context, isDarkMode, _) {

        return MaterialApp(

          debugShowCheckedModeBanner: false,

          title: "StyleSync",

          themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,

          theme: ThemeData(

            brightness: Brightness.light,
            primarySwatch: Colors.grey,
            primaryColor: Colors.black,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
            cardColor: Colors.white,
            textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.black)),

          ),

          darkTheme: ThemeData(

            brightness: Brightness.dark,
            primarySwatch: Colors.grey,
            primaryColor: Colors.white,
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
            cardColor: const Color(0xFF1A1A1A),
            textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),

          ),

          home: const MainNavigation(),

        );

      },

    );

  }

}




class MainNavigation extends StatefulWidget {

  const MainNavigation({super.key});


  @override
  State<MainNavigation> createState() => _MainNavigationState();

}



class _MainNavigationState extends State<MainNavigation> {


  int currentIndex = 0;



  final List<Widget> pages = [

    const HomePage(),

    const ClosetPage(),

    const StylistPage(),

    const SavedPage(),

    const ProfilePage(),

  ];



  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: pages[currentIndex],



      bottomNavigationBar: BottomNavigationBar(

        currentIndex: currentIndex,


        onTap: (index){

          setState(() {

            currentIndex = index;

          });

        },


        type: BottomNavigationBarType.fixed,


        backgroundColor: Theme.of(context).scaffoldBackgroundColor,


        selectedItemColor: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,


        unselectedItemColor: Colors.grey,


        items: const [


          BottomNavigationBarItem(

            icon: Icon(Icons.home_outlined),

            label: "Home",

          ),



          BottomNavigationBarItem(

            icon: Icon(Icons.checkroom_outlined),

            label: "Closet",

          ),



          BottomNavigationBarItem(

            icon: Icon(Icons.auto_awesome),

            label: "AI Stylist",

          ),



          BottomNavigationBarItem(

            icon: Icon(Icons.favorite_border),

            label: "Saved",

          ),



          BottomNavigationBarItem(

            icon: Icon(Icons.person_outline),

            label: "Profile",

          ),


        ],

      ),

    );

  }

}