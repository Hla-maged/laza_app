// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:laza_app/features/home/presentation/views/widgets/custom_app_bar.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../../constants.dart';

// class ProfileView extends StatefulWidget {
//   final String name;
//   final String email;

//   const ProfileView({
//     super.key,
//     required this.name,
//     required this.email,
//   });

//   @override
//   State<ProfileView> createState() => ProfileViewState();
// }

// class ProfileViewState extends State<ProfileView> {
//   File? profileImage;

//   @override
//   void initState() {
//     super.initState();
//     loadImage();
//   }

//   Future<void> loadImage() async {
//     final prefs = await SharedPreferences.getInstance();
//     final imagePath = prefs.getString('profile_image');
//     if (imagePath != null && File(imagePath).existsSync()) {
//       setState(() {
//         profileImage = File(imagePath);
//       });
//     }
//   }

//   Future<void> pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       final image = File(pickedFile.path);

//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setString('profile_image', image.path);

//       setState(() {
//         profileImage = image;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(
//               height: 40,
//             ),
//             const CustomAppBar(
//               title: 'Profile',
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//             SizedBox(
//                 width: 300,
//                 height: 220,
//                 child: Image.asset(
//                   'assets/images/profile.jpg',
//                   fit: BoxFit.cover,
//                 )),
//             const SizedBox(
//               height: 40,
//             ),
//             GestureDetector(
//               onTap: pickImage,
//               child: CircleAvatar(
//                 radius: 60,
//                 backgroundColor: kPrimaryColor,
//                 backgroundImage:
//                     profileImage != null ? FileImage(profileImage!) : null,
//                 child: profileImage == null
//                     ? const Icon(
//                         Icons.camera_alt,
//                         size: 40,
//                         color: Colors.white,
//                       )
//                     : null,
//               ),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               widget.name,
//               style: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             //const SizedBox(height: 10),
//             Text(
//               widget.email,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey,
//               ),
//             ),
//             const SizedBox(height: 50),
//             ElevatedButton(
//               onPressed: () {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(content: Text("Profile Saved!")),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: kPrimaryColor,
//               ),
//               child: Text(
//                 "Save Profile",
//                 style: TextStyle(fontSize: 16, color: Colors.grey[100]),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
