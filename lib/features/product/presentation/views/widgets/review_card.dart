import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewCard extends StatefulWidget {
  const ReviewCard(
      {super.key, required this.name, required this.desc, required this.rate});
  final String name, desc;
  final double rate;

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
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

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              CircleAvatar(
                radius: 25,
                backgroundImage:
                    profileImage != null ? FileImage(profileImage!) : null,
                child: profileImage == null
                    ?
                    Image.asset(
                        'assets/images/user.jpg',
                      )
                    : null,
              ),
              const SizedBox(width: 8),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Text(
                  '25 Nov, 2024',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ]),
              const SizedBox(
                width: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(children: [
                        TextSpan(
                            text: '${widget.rate} ',
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.black)),
                        const TextSpan(
                            text: 'rating',
                            style: TextStyle(
                              color: Colors.grey,
                            ))
                      ])),
                  RatingBarIndicator(
                    rating: 4,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 15,
                  ),
                ],
              ),
            ]),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  widget.desc,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
