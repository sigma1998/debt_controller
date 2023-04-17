import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Television extends StatelessWidget {
  const Television({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}


class Telephone extends StatelessWidget {
  const Telephone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class HouseholdAppliances extends StatelessWidget {
  const HouseholdAppliances({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class Product extends StatelessWidget {
  String productName="";

  final Function() onTabConnect;
  Product({Key? key,required this.productName,required this.onTabConnect}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTabConnect.call();
      },
      child: Container(
        height: 150,
        width: 100,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.yellow,
        ),
        child: Center(
          child: Text(productName,style: const TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}





