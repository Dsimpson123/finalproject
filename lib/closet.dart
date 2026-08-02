import 'package:flutter/material.dart';


class ClosetPage extends StatefulWidget {
  const ClosetPage({super.key});

  @override
  State<ClosetPage> createState() => _ClosetPageState();
}


class _ClosetPageState extends State<ClosetPage> {
  List<ClothingItem> clothes = [
    ClothingItem(
      name: "Oversized Hoodie",
      category: "Hoodie",
      image: "lib/images/hoodie.png",
    ),
    ClothingItem(
      name: "Cargo Pants",
      category: "Pants",
      image: "lib/images/cargo.png",
    ),
    ClothingItem(
      name: "Jordan Sneakers",
      category: "Shoes",
      image: "lib/images/Jordan.png",
    ),
    ClothingItem(
      name: "Bape T-Shirt",
      category: "Shirt",
      image: "lib/images/tshirt.png",
    ),
  ];

  void addClothing() {
    setState(() {
      clothes.add(
        ClothingItem(
          name: "New Clothing",
          category: "Other",
          image: "lib/images/yellow.png",
        ),
      );
    });
  }

  void deleteClothing(int index) {
    setState(() {
      clothes.removeAt(index);
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
          "MY CLOSET",
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
          )
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
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: clothes.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: .75,
                ),
                itemBuilder: (context, index) {
                  final item = clothes[index];
                  return GestureDetector(
                    onLongPress: () {
                      deleteClothing(index);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 130,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                item.image,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Icon(
                                      Icons.checkroom,
                                      size: 60,
                                      color: Colors.black,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            item.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            item.category,
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
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
