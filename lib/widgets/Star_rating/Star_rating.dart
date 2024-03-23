import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final int starCount;
  final double size;
  final Color color;
  final Color borderColor;

  const StarRating({
    super.key,
    required this.rating,
    this.starCount = 5,
    this.size = 13.0,
    this.color = Colors.orangeAccent,
    this.borderColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(starCount, (index) {
        double ratingValue = index + 1.0;
        IconData starIcon = Icons.star;

        if (rating < ratingValue) {
          starIcon = Icons.star_border;
        } else if (rating > ratingValue - 1) {
          starIcon = Icons.star;
        } else {
          starIcon = Icons.star_half;
        }

        return Container(
          padding: const EdgeInsets.all(2.0),
          child: Icon(
            starIcon,
            size: size,
            color: rating >= ratingValue ? color : borderColor,
          ),
        );
      }),
    );
  }
}
