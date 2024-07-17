import 'package:ample_click/presentation/widgets/profile-item.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PharmacyProfile(),
    );
  }
}

class PharmacyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 0, 0, 0)),
          onPressed: () {},
        ),
        title: Text(
          'Profile',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: Column(
            children: [
              Container(
                color: const Color.fromRGBO(148, 128, 249, 100),
                width: double.infinity,
                padding: EdgeInsets.all(26),
                margin: EdgeInsets.all(0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: CachedNetworkImageProvider(
                        './assets/pharma_profile.jpg', // Replace with your image URL
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              ProfileItem(
                title: 'Pharmacy Name',
                value: 'Downtown Pharmacy',
              ),
              ProfileItem(
                title: 'Phone Number',
                value: '+251 938 903 153',
              ),
              ProfileItem(
                title: 'Email',
                value: 'Test@Gmail.Com',
              ),
              ProfileItem(
                title: 'Location',
                value: '7958 Swift Village',
              ),
              ProfileItem(
                title: 'Tin Number',
                value: '938*********',
              ),
            ],
          ),
        ),
      ),
      
    );
  }
}
