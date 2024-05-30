import 'package:flutter/material.dart';
import 'package:ghumakkad_2/models/location_model.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  final String categoryName;
  const CategoryCard(
      {super.key, required this.categoryName, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 10, right: 8),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.7),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.topRight,
            child: const Icon(
              Icons.bookmark_border_outlined,
              color: Color.fromARGB(255, 181, 159, 159),
              size: 30,
            ),
          ),
          const Spacer(),
          Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              categoryName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
