import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  const InfoItem(
      {super.key,
      required this.info,
      required this.sub,
      required this.title,
      required this.image,
      required this.navigate});
  final String info, sub, title, image, navigate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, navigate),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    )),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.16,
                      height: MediaQuery.of(context).size.width * 0.15,
                      child: Image.asset(
                        image,
                        fit: BoxFit.fill,
                      )),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(info),
                      Text(sub, style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
              const Icon(Icons.check_circle, color: Colors.green),
            ],
          ),
        ],
      ),
    );
  }
}
