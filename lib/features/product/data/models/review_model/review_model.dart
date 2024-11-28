import 'package:laza_app/features/product/domain/entites/review_entity.dart';

class ReviewModel extends ReviewEntity {
  String username;
  @override
  String feedback;
  @override
  double rating;

  ReviewModel(
      {required this.username, required this.feedback, required this.rating})
      : super(name: username, feedback: feedback, rating: rating);

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
        username: json['Username'] as String,
        feedback: json['Feedback'] as String,
        rating: json['Rating'] as double,
      );

  Map<String, dynamic> toJson() => {
        'Username': username,
        'Feedback': feedback,
        'Rating': rating,
      };
}
