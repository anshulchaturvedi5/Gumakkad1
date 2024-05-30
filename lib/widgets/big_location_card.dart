import 'package:flutter/material.dart';

class BigLocationCard extends StatelessWidget {
  final String image;
  final String locationName;
  const BigLocationCard({super.key, required this.image, required this.locationName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            opacity: 0.8,
            image: NetworkImage(image),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.9),
              BlendMode.dstATop,
            ),
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Text(
                  locationName,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
