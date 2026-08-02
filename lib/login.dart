import 'package:flutter/material.dart';
import 'home.dart';
import 'signup.dart';


class LoginPage extends StatefulWidget {

  const LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();

}



class _LoginPageState extends State<LoginPage> {


  final emailController = TextEditingController();

  final passwordController = TextEditingController();


  bool hidePassword = true;



  void login(){


    if(emailController.text.isEmpty ||
       passwordController.text.isEmpty){


      ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(

          content: Text(
            "Please enter your email and password",
          ),

        ),

      );


      return;

    }



    Navigator.pushReplacement(

      context,

      MaterialPageRoute(

        builder: (context)=> HomePage(

          userName: emailController.text.split("@")[0],

        ),

      ),

    );


  }




  @override
  void dispose(){

    emailController.dispose();

    passwordController.dispose();

    super.dispose();

  }





  @override
  Widget build(BuildContext context){


    return Scaffold(


      backgroundColor: Colors.white,



      body: SafeArea(


        child: SingleChildScrollView(


          padding: const EdgeInsets.symmetric(
            horizontal: 28,
          ),



          child: Column(


            crossAxisAlignment: CrossAxisAlignment.start,



            children: [



              const SizedBox(height: 70),




              const Center(

                child: Text(

                  "STYLE AI",

                  style: TextStyle(

                    color: Colors.black,

                    fontSize: 38,

                    fontWeight: FontWeight.bold,

                    letterSpacing: 3,

                  ),

                ),

              ),




              const SizedBox(height: 10),




              const Center(

                child: Text(

                  "Your personal AI outfit stylist",

                  style: TextStyle(

                    color: Colors.grey,

                    fontSize: 16,

                  ),

                ),

              ),




              const SizedBox(height: 50),




              const Text(

                "Email",

                style: TextStyle(

                  fontWeight: FontWeight.bold,

                  fontSize: 16,

                ),

              ),




              const SizedBox(height: 10),




              TextField(

                controller: emailController,


                decoration: InputDecoration(


                  hintText: "Enter your email",


                  filled: true,


                  fillColor: Colors.grey.shade200,


                  border: OutlineInputBorder(


                    borderRadius:
                    BorderRadius.circular(18),


                    borderSide: BorderSide.none,


                  ),


                ),

              ),




              const SizedBox(height: 25),





              const Text(

                "Password",

                style: TextStyle(

                  fontWeight: FontWeight.bold,

                  fontSize: 16,

                ),

              ),




              const SizedBox(height: 10),





              TextField(


                controller: passwordController,


                obscureText: hidePassword,



                decoration: InputDecoration(



                  hintText: "Enter your password",



                  filled: true,



                  fillColor: Colors.grey.shade200,



                  border: OutlineInputBorder(


                    borderRadius:

                    BorderRadius.circular(18),



                    borderSide: BorderSide.none,


                  ),



                  suffixIcon: IconButton(


                    icon: Icon(


                      hidePassword

                      ? Icons.visibility_off

                      : Icons.visibility,


                      color: Colors.black,


                    ),



                    onPressed: (){


                      setState((){


                        hidePassword = !hidePassword;


                      });


                    },


                  ),



                ),


              ),





              const SizedBox(height: 15),





              Align(


                alignment: Alignment.centerRight,



                child: TextButton(


                  onPressed: () {},



                  child: const Text(


                    "Forgot Password?",



                    style: TextStyle(

                      color: Colors.black,

                    ),

                  ),


                ),


              ),





              const SizedBox(height: 25),






              SizedBox(


                width: double.infinity,


                height: 58,



                child: ElevatedButton(



                  onPressed: login,



                  style: ElevatedButton.styleFrom(



                    backgroundColor: Colors.black,



                    foregroundColor: Colors.white,



                    shape: RoundedRectangleBorder(



                      borderRadius:

                      BorderRadius.circular(18),



                    ),



                  ),




                  child: const Text(


                    "Log In",



                    style: TextStyle(



                      fontSize: 18,



                      fontWeight: FontWeight.bold,


                    ),


                  ),


                ),


              ),






              const SizedBox(height: 35),






              Row(



                children: const [



                  Expanded(

                    child: Divider(),

                  ),



                  Padding(

                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),

                    child: Text("OR"),

                  ),



                  Expanded(

                    child: Divider(),

                  ),



                ],



              ),





              const SizedBox(height: 30),





              SizedBox(


                width: double.infinity,


                height: 55,



                child: OutlinedButton.icon(



                  icon: const Icon(

                    Icons.apple,

                    color: Colors.black,

                  ),




                  label: const Text(


                    "Continue with Apple",



                    style: TextStyle(

                      color: Colors.black,

                      fontWeight: FontWeight.bold,

                    ),


                  ),



                  onPressed: () {},



                ),


              ),





              const SizedBox(height: 15),





              SizedBox(


                width: double.infinity,


                height: 55,



                child: OutlinedButton.icon(



                  icon: const Icon(

                    Icons.g_mobiledata,

                    color: Colors.black,

                    size: 35,

                  ),




                  label: const Text(


                    "Continue with Google",



                    style: TextStyle(

                      color: Colors.black,

                      fontWeight: FontWeight.bold,

                    ),


                  ),



                  onPressed: () {},



                ),


              ),





              const SizedBox(height: 35),





              Row(


                mainAxisAlignment:

                MainAxisAlignment.center,



                children: [



                  const Text(

                    "Don't have an account?",

                  ),




                  TextButton(


                    onPressed: (){


                      Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (context)=>

                          const SignUpPage(),

                        ),

                      );


                    },



                    child: const Text(


                      "Sign Up",



                      style: TextStyle(

                        color: Colors.black,

                        fontWeight: FontWeight.bold,

                      ),


                    ),



                  ),



                ],



              ),



            ],



          ),



        ),



      ),



    );


  }


}