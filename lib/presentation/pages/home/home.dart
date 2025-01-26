
import 'package:ecom/domain/entities/user_entity.dart';
import 'package:ecom/presentation/pages/home/widjets/bestoffer.dart';
import 'package:ecom/presentation/pages/home/widjets/catagory1.dart';
import 'package:ecom/presentation/pages/home/silder/slider.dart';
import 'package:ecom/presentation/pages/home/widjets/toppselling.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/topcontroller.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final UserEntity user = Get.arguments;
      final   topcontroller = Get.put(());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width + 50, kToolbarHeight),
        child: AppBar(
          backgroundColor: Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, ${user.name}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'lets start shoping',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 253, 247, 193),
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                icon: Icon(Icons.favorite, color: Colors.black),
                onPressed: () {},
              ),
            ),
            SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 253, 247, 193),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.notifications, color: Colors.black),
                    onPressed: () {},
                  ),
                  Positioned(
                    right: 0,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: Colors.red,
                      child: Text(
                        '1',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.transparent,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                  ),
                ),
              ),
            ),
            PremiumSlider(),
            SizedBox(height: 20),
            Categories(),
            SizedBox(height: 10),
            bestoffffer(),
            SizedBox(height: 10),

            TopSelling(),
            SizedBox(height: 20),

          ],
        ),
      ),
    );
  }
}



