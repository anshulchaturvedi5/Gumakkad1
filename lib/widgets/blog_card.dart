import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  final String image;
  final String locationName;
  final String description;

  BlogCard({
    required this.image,
    required this.locationName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Displaying asset image
          Image.asset(
            image,
            fit: BoxFit.cover, // Adjusts the image size to fit the card
            width: double
                .infinity, // Makes the image take the full width of the card
            height: 300, // Sets the height of the image
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  locationName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}