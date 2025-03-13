// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddProductPage(),
    );
  }
}

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController imageURLController = TextEditingController();
  final Dio dio = Dio();

  Future<void> addProduct() async {
    const String apiUrl = 'http://192.168.1.101:5000/api/produce/add';
    try {
          SharedPreferences prefs = await SharedPreferences.getInstance();
    String? farmerId = prefs.getString("farmerId"); // ✅ Fetch stored ID

    if (farmerId == null) {
      print("Error: Farmer ID not found!");
      return;
    }
      final response = await dio.post(apiUrl, data: {
        "name": nameController.text,
        "category": categoryController.text,
        "price": double.parse(priceController.text),
        "quantity": int.parse(quantityController.text),
        "location": locationController.text,
        "farmerId": farmerId, // Change this to dynamic
        "imageURL": imageURLController.text
      });

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Product Added Successfully!")),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProductsPage()),
        );
      }
    } catch (e) {
      print("Error adding product: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Product")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: "Product Name")),
            TextField(
                controller: categoryController,
                decoration: const InputDecoration(labelText: "Category")),
            TextField(
                controller: priceController,
                decoration: const InputDecoration(labelText: "Price"),
                keyboardType: TextInputType.number),
            TextField(
                controller: quantityController,
                decoration: const InputDecoration(labelText: "Quantity"),
                keyboardType: TextInputType.number),
            TextField(
                controller: locationController,
                decoration: const InputDecoration(labelText: "Location")),
            TextField(
                controller: imageURLController,
                decoration: const InputDecoration(labelText: "Image URL")),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: addProduct,
              child: const Text("Add Product"),
            )
          ],
        ),
      ),
    );
  }
}

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  List<dynamic> products = [];
  final Dio dio = Dio();

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    const String apiUrl = 'http:// 192.168.1.101:5000/api/produce/all';
    try {
      final response = await dio.get(apiUrl);
      if (response.statusCode == 200) {
        setState(() {
          products = response.data;
        });
      }
    } catch (e) {
      print("Error fetching products: $e");
    }
  }

  Future<void> addToCart(String productId) async {
    const String apiUrl = 'http:// 192.168.1.101:5000/api/cart/add';
    try {
      final response = await dio.post(apiUrl, data: {
        "customerId": "your-customer-id", // Change this dynamically
        "items": [
          {"produce": productId, "quantity": 1}
        ],
        "totalAmount": 0 // Modify if necessary
      });

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Added to cart!")),
        );
      }
    } catch (e) {
      print("Error adding to cart: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product["name"]),
            subtitle: Text("₹${product["price"]}"),
            trailing: IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: () => addToCart(product["_id"]),
            ),
          );
        },
      ),
    );
  }
}
