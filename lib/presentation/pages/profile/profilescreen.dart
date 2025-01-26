import 'package:ecom/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class profilescreen extends StatelessWidget {
     final UserEntity user = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 248, 248),
      appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 248, 248, 248),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, size: 20),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Color.fromARGB(255, 10, 37, 117),
                  backgroundImage: NetworkImage(
                      'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwallpapersafari.com%2Fboy-profile-wallpapers%2F&psig=AOvVaw3V0_KRZEee63XzyOkZNStN&ust=1737873804388000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCJCv5MmikIsDFQAAAAAdAAAAABAJ'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 18,
                  backgroundColor: Color.fromARGB(255, 215, 188, 15),
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt, size: 18, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
                user.name,              
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
               user.email,             
                style: const TextStyle(
                color: Color.fromARGB(255, 235, 188, 33),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20), 
            _buildWishlistTile(context),
            const SizedBox(height: 10), 
            _buildOrderTile(context),
            const SizedBox(height: 10), 
            _buildAddressTile(context),
            const SizedBox(height: 10), 
            _buildPaymentTile(context),
            const SizedBox(height: 10), 
            _buildLogoutTile(context),
            const SizedBox(height: 20), 
          ],
        ),
      ),
    );
  }

  Widget _buildWishlistTile(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 10), 
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 180, 178, 178).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: const Icon(Icons.favorite_outline, color: Color.fromARGB(255, 235, 188, 33)),
        title: const Text(
          'Wishlist',
          style: TextStyle(color: Color.fromARGB(255, 37, 37, 36), fontSize: 16),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }

  Widget _buildOrderTile(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 10), 
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 180, 178, 178).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: const Icon(Icons.history, color: Color.fromARGB(255, 235, 188, 33)),
        title: const Text(
          'Order History',
          style: TextStyle(color: Color.fromARGB(255, 37, 37, 36), fontSize: 16),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }

  Widget _buildAddressTile(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 10), 
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 180, 178, 178).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: const Icon(Icons.location_on, color: Color.fromARGB(255, 235, 188, 33)),
        title: const Text(
          'Address',
          style: TextStyle(color: Color.fromARGB(255, 37, 37, 36), fontSize: 16),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }

  Widget _buildPaymentTile(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 10), 
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 180, 178, 178).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: const Icon(Icons.payment, color: Color.fromARGB(255, 235, 188, 33)),
        title: const Text(
          'Payment Method',
          style: TextStyle(color: Color.fromARGB(255, 37, 37, 36), fontSize: 16),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }

  Widget _buildLogoutTile(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 55,
      margin: const EdgeInsets.symmetric(horizontal: 20), 
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 180, 178, 178).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: const Icon(Icons.logout, color: Color.fromARGB(255, 235, 188, 33)),
        title: const Text(
          'Logout',
          style: TextStyle(color: Color.fromARGB(255, 37, 37, 36), fontSize: 16),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}

