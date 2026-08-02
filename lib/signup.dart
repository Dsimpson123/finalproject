import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';


class SignUpPage extends StatefulWidget {

  const SignUpPage({super.key});


  @override
  State<SignUpPage> createState() => _SignUpPageState();

}



class _SignUpPageState extends State<SignUpPage> {


  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();



  bool hidePassword = true;




  void createAccount(){


    if(nameController.text.isEmpty ||
       emailController.text.isEmpty ||
       passwordController.text.isEmpty){


      ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(

          content: Text(
            "Please complete all fields",
          ),

        ),

      );


      return;

    }





    Navigator.pushReplacement(


      context,


      MaterialPageRoute(


        builder: (context)=>HomePage(


          userName: nameController.text.trim(),


        ),


      ),


    );



  }







  @override
  void dispose(){


    nameController.dispose();

    emailController.dispose();

    passwordController.dispose();


    super.dispose();


  }






  Widget inputField({


    required String hint,


    required TextEditingController controller,


    bool password = false,


  }){


    return TextField(


      controller: controller,


      obscureText: password ? hidePassword : false,



      decoration: InputDecoration(



        hintText: hint,



        filled: true,



        fillColor: Colors.grey.shade200,



        border: OutlineInputBorder(



          borderRadius: BorderRadius.circular(18),



          borderSide: BorderSide.none,



        ),



        suffixIcon: password


        ? IconButton(


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


          )


        : null,



      ),



    );


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



              const SizedBox(height: 60),





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



                  "Create your personal fashion profile",



                  style: TextStyle(



                    color: Colors.grey,


                    fontSize: 16,



                  ),



                ),



              ),





              const SizedBox(height: 45),





              const Text(



                "Name",



                style: TextStyle(



                  fontWeight: FontWeight.bold,


                  fontSize: 16,



                ),



              ),





              const SizedBox(height: 10),




              inputField(


                hint: "Enter your name",


                controller: nameController,


              ),





              const SizedBox(height: 25),






              const Text(



                "Email",



                style: TextStyle(



                  fontWeight: FontWeight.bold,


                  fontSize: 16,



                ),



              ),




              const SizedBox(height: 10),





              inputField(


                hint: "Enter your email",


                controller: emailController,


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





              inputField(


                hint: "Create password",


                controller: passwordController,


                password: true,


              ),





              const SizedBox(height: 35),





              SizedBox(



                width: double.infinity,



                height: 58,



                child: ElevatedButton(



                  onPressed: createAccount,



                  style: ElevatedButton.styleFrom(



                    backgroundColor: Colors.black,



                    foregroundColor: Colors.white,



                    shape: RoundedRectangleBorder(



                      borderRadius:

                      BorderRadius.circular(18),



                    ),



                  ),




                  child: const Text(



                    "Create Account",



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


                    padding:

                    EdgeInsets.symmetric(horizontal: 15),



                    child: Text("OR"),



                  ),




                  Expanded(

                    child: Divider(),

                  ),



                ],



              ),





              const SizedBox(height: 25),





              SizedBox(



                width: double.infinity,



                height: 55,



                child: OutlinedButton.icon(



                  onPressed: () {},



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



                ),



              ),





              const SizedBox(height: 15),





              SizedBox(



                width: double.infinity,



                height: 55,



                child: OutlinedButton.icon(



                  onPressed: () {},



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



                ),



              ),





              const SizedBox(height: 35),





              Row(



                mainAxisAlignment:

                MainAxisAlignment.center,



                children: [



                  const Text(

                    "Already have an account?",

                  ),




                  TextButton(



                    onPressed: (){



                      Navigator.push(



                        context,



                        MaterialPageRoute(



                          builder: (context)=>

                          const LoginPage(),



                        ),



                      );



                    },




                    child: const Text(



                      "Log In",



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