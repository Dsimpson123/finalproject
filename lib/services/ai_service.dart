import 'dart:math';


class AIService {


  // Generate outfit recommendation
  static Map<String, String> generateOutfit({

    required List<String> closet,

    required String occasion,

    required String weather,

    required String style,

  }) {



    if (closet.isEmpty) {

      return {

        "title": "Add Clothes",

        "top": "Upload items to your closet",

        "bottom": "AI needs your wardrobe",

        "shoes": "Add shoes",

        "reason": "Your closet is empty",

      };

    }



    final random = Random();



    String selectedTop =
    closet[random.nextInt(closet.length)];



    String selectedBottom =
    closet[random.nextInt(closet.length)];



    String selectedShoes =
    closet[random.nextInt(closet.length)];





    String recommendation = "";



    if(weather == "Cold"){

      recommendation =
      "Layer your outfit with warmer pieces.";

    }

    else if(weather == "Hot"){

      recommendation =
      "Choose lighter clothing for comfort.";

    }

    else{

      recommendation =
      "This outfit matches today's conditions.";

    }





    return {


      "title":
      "$style $occasion Outfit",



      "top":
      selectedTop,



      "bottom":
      selectedBottom,



      "shoes":
      selectedShoes,



      "reason":
      recommendation,


    };

  }





  // AI style suggestions

  static List<String> getStyleSuggestions(){


    return [


      "Streetwear",

      "Minimal",

      "Luxury",

      "Vintage",

      "Athleisure",

      "Casual",


    ];


  }





  // Weather outfit suggestions


  static String weatherRecommendation(String weather){


    switch(weather){


      case "Rainy":

        return "Wear waterproof shoes and a jacket.";



      case "Cold":

        return "Try hoodies, jackets, and layered outfits.";



      case "Hot":

        return "Choose shorts, tees, and lighter fabrics.";



      default:

        return "Perfect weather for any outfit.";

    }


  }




}