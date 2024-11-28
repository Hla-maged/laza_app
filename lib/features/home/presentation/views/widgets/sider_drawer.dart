import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../constants.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({
    super.key,
    required this.user,
    required this.email,
  });
  final String user, email;

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  File? profileImage;

  @override
  void initState() {
    super.initState();
    loadImage();
  }

  Future<void> loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('profile_image');
    if (imagePath != null && File(imagePath).existsSync()) {
      setState(() {
        profileImage = File(imagePath);
      });
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final image = File(pickedFile.path);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profile_image', image.path);

      setState(() {
        profileImage = image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
      padding: const EdgeInsets.only(top: 50, left: 20),
      child: Column(children: [
        Row(
          children: [
            GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.menu))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: pickImage,
              child: CircleAvatar(
                radius: 35,
                backgroundColor: kPrimaryColor,
                backgroundImage:
                    profileImage != null ? FileImage(profileImage!) : null,
                child: profileImage == null
                    ? const Icon(
                        Icons.camera_alt,
                        size: 35,
                        color: Colors.white,
                      )
                    : null,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  widget.email,
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                )
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        ListTile(
          leading: const Icon(Icons.info_outline),
          title: const Text('Account Information'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.lock_outline),
          title: const Text('Password'),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.shopping_bag_outlined),
          title: const Text('Order'),
          onTap: () {
            Navigator.pushNamed(context, 'order');
          },
        ),
        ListTile(
          leading: const Icon(Icons.favorite_outline),
          title: const Text('Wishlist'),
          onTap: () {
            Navigator.pushNamed(context, 'wishlist');
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings_outlined),
          title: const Text('Settings'),
          onTap: () {},
        ),
        const SizedBox(
          height: 60,
        ),
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.red),
          title: const Text('Logout', style: TextStyle(color: Colors.red)),
          onTap: () {
            logout();
            Navigator.pushReplacementNamed(context, 'signIn');
          },
        ),
      ]),
    ));
  }

  Future<void> logout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove('token');
    await preferences.setBool('loggedIn', false);
  }
}
