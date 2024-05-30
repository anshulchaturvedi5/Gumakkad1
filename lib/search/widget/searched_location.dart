import 'package:flutter/material.dart';
import 'package:ghumakkad_2/screens/home/location_detail.dart';
import 'package:ghumakkad_2/models/location_model.dart';
import 'package:ghumakkad_2/search/searched_location_detail.dart';
import 'package:ghumakkad_2/search/widget/searched_location_card.dart';

class SearchedLocation extends StatelessWidget {
  // final String image;
  // final String title;
  // final String description;
  // const SearchedLocation({super.key, required this.image, required this.title, required this.description});
  final LocationModel locationModel;
  const SearchedLocation({super.key, required this.locationModel});

  @override
  Widget build(BuildContext context) {
    print("HIIII");
    return GestureDetector(
      onTap: () {
        print("on ontap");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchedLocationDetailsScreen(
              locationModel: locationModel,
            ),
          ),
        );
      },
      child: SearchedLocationCard(
        locationModel: locationModel,
      ),
    );
  }
}
