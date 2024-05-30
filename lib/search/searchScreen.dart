import 'package:flutter/material.dart';
import 'package:ghumakkad_2/models/location_model.dart';
import 'package:ghumakkad_2/search/services/search_services.dart';
import 'package:ghumakkad_2/search/widget/searched_location.dart';
import 'package:ghumakkad_2/widgets/loader.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<LocationModel>? locationList;
  final SearchServices searchServices = SearchServices();

  fetchSearchedLocation(String searchQuery) async {
    print("in search");
    locationList = await searchServices.fetchSearchedLocation(
      context: context,
      searchQuery: searchQuery,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            Expanded(
              child: Container(
                height: 42,
                // margin: const EdgeInsets.only(left: 5),
                child: Material(
                  borderRadius: BorderRadius.circular(7),
                  elevation: 1,
                  child: TextFormField(
                    onFieldSubmitted: fetchSearchedLocation,
                    decoration: const InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 6),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 23,
                        ),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      contentPadding: EdgeInsets.only(top: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        borderSide: BorderSide(
                          color: Colors.black38,
                          width: 1,
                        ),
                      ),
                      hintText: 'Search Ghumakkad',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: locationList == null
          ? const Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Search Ghumakkad to know more",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "about your travel destination",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          )
          : SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: width / (height / 1.5),
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 15,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    if (locationList != null && locationList!.isNotEmpty) {
                      if (index >= 0 && index < locationList!.length) {
                        print(index);
                        return SearchedLocation(
                          locationModel: locationList![index],
                        );
                      } else {
                        print("Index out of bounds");
                      }
                    } else {
                      print("Data is empty or null");
                    }
                  },
                ),
                // child: ListView.builder(
                //   itemCount: locationList!.length,
                //   itemBuilder: (context, index) => SearchedLocation(
                //     locationModel: locationList![index],
                //   ),
                //   scrollDirection: Axis.horizontal,
                // ),
              ),
            ),
    );
  }
}
