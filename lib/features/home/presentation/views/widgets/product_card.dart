import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'favorite_icon.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.title,
    required this.image,
    required this.price,
    required this.id,
  });

  final String title, image, id;
  final double price;
  final String baseUrl = 'https://laza.runasp.net';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, 'productDetails', arguments: id),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: 
                    CachedNetworkImage(
                      imageUrl: '$baseUrl/$image',
                      width: double.infinity,
                      height: 200.h,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        color: Colors.grey,
                      )),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    )

                    //  Image.network(
                    //   '$baseUrl/$image',
                    // width: double.infinity,
                    // height: 200.h,
                    // fit: BoxFit.fill,
                    // ),
                    ),
                FavoriteIcon(
                  title: title,
                  id: id,
                  image: image,
                  price: price,
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              title,
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.visible,
              style: TextStyle(
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              '$price EGP',
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
                //color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
