import 'package:debt_controller/ui/screens/home/widget/widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          "Debit Controller",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          Product(productName: "Telivizor", onTabConnect: () {  } ),
          Product(productName: "Telifon", onTabConnect: () {  }),
          Product(productName: "Boshqa", onTabConnect: () {  }),
          Product(productName: "Velosiped", onTabConnect: () {  }),
        ],
      ),
    );
  }
}
