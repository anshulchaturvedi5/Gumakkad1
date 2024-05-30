import 'package:flutter/material.dart';
import 'package:ghumakkad_2/models/location_model.dart';

class SearchedLocationCard extends StatelessWidget {
  final LocationModel locationModel;
  const SearchedLocationCard({super.key, required this.locationModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 10, right: 10),
      decoration: locationModel.image.isNotEmpty
    ? 
    BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(locationModel.image),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.7),
            BlendMode.dstATop,
          ),
        ),
      )
    : BoxDecoration(
        color: Colors.grey, // or any other fallback color
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
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
              locationModel.name,
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
