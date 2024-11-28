class Image {
  String? image;

  Image({this.image});

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        image: json['Image'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'Image': image,
      };
}
