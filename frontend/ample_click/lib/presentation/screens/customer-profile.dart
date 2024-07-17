import 'package:ample_click/presentation/widgets/profile-item.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

class CustomerProfile extends StatefulWidget {
  CustomerProfile();
  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back,
                color: Color.fromARGB(255, 0, 0, 0)),
            onPressed: () {
              context.pop();
            },
          ),
          title: const Text(
            'Profile',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
          child: Column(
            children: [
              Container(
                color: const Color.fromRGBO(148, 128, 249, 100),
                width: double.infinity,
                padding: EdgeInsets.all(26),
                margin: EdgeInsets.all(0),
                child: const Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: CachedNetworkImageProvider(
                        './assets/profile-pic.png',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              ProfileItem(
                title: 'Full Name',
                value: 'Samuel Endale',
              ),
              ProfileItem(
                title: 'Phone Number',
                value: '+251 938 903 153',
              ),
              ProfileItem(
                title: 'Email',
                value: 'Test@Gmail.Com',
              ),
            ],
          ),
        ),);
  }
}
