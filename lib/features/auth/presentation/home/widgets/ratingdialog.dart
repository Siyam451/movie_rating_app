import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingDialog extends StatefulWidget {

  final String movieTitle;
  final Function(double rating)? onSubmit;

  const RatingDialog({
    super.key,
    required this.movieTitle,
    this.onSubmit,
  });

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {

  double userRating = 3;

  @override
  Widget build(BuildContext context) {

    return AlertDialog(

      title: Text("Rate ${widget.movieTitle}"),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          const Text("Give your rating"),

          const SizedBox(height: 20),

          RatingBar.builder(
            initialRating: userRating,
            minRating: 1,
            allowHalfRating: true,
            itemCount: 5,

            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.orange,
            ),

            onRatingUpdate: (rating) {
              setState(() {
                userRating = rating;
              });
            },
          ),

        ],
      ),

      actions: [

        /// Cancel Button
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),

        /// Submit Button
        ElevatedButton(
          onPressed: () {

            if (widget.onSubmit != null) {
              widget.onSubmit!(userRating);
            }

            Navigator.pop(context);
          },
          child: const Text("Submit"),
        ),

      ],
    );
  }
}