import 'package:ecom/domain/entities/user_entity.dart';
import 'package:ecom/presentation/pages/cart/card.dart';
import 'package:ecom/presentation/pages/catagory/cataogory.dart';
import 'package:ecom/presentation/pages/home/home.dart';
import 'package:ecom/presentation/pages/profile/profilescreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BottomNavigationScreen extends StatefulWidget {
  @override
  _BottomNavigationScreenState createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
       final UserEntity user = Get.arguments;

  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    CategoryScreen(),
        HomeScreen(),
CartPage(),
    profilescreen(),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 248, 248),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromARGB(255, 226, 125, 16),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wind_power),
            label: 'offer',
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'card',
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          ),
        ],
      ),
    );
  }
}