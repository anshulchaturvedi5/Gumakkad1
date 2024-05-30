import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ghumakkad_2/models/location_model.dart';

class SearchedLocationDetailsScreen extends StatefulWidget {
  final LocationModel locationModel;
  const SearchedLocationDetailsScreen({super.key, required this.locationModel});

  @override
  State<SearchedLocationDetailsScreen> createState() =>
      _SearchedLocationDetailsScreenState();
}

class _SearchedLocationDetailsScreenState
    extends State<SearchedLocationDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            Text(widget.locationModel.name),
          ],
        ),
      ),
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Center(
              child: Text(
                widget.locationModel.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Image(
              image: NetworkImage(
                widget.locationModel.image,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.locationModel.description,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
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
