import 'package:flutter/material.dart';
import 'package:ghumakkad_2/screens/home/location_detail.dart';
import 'package:ghumakkad_2/utils/constants.dart';
import 'package:ghumakkad_2/widgets/big_location_card.dart';
import 'package:ghumakkad_2/widgets/location_card.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;

class PopularTrips extends StatefulWidget {
  const PopularTrips({super.key});

  @override
  State<PopularTrips> createState() => _PopularTripsState();
}

class _PopularTripsState extends State<PopularTrips> {
  List<String> titles = [];
  List<String> urlImages = [];
  var selectedIndex = 0;
  var trips = [
    'Two Days',
    'Road Trips',
    'Pan India',
  ];

  Future getPopularTwoDays() async {
    final url = Uri.parse(
        'https://www.incredibleindia.org/content/incredible-india-v2/en.html');
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final titles = html
        .querySelectorAll(
            '#popular_tab_list-0 > div > div.owl-stage-outer > div > div[class*="owl-item"] > div > a > div > h2')
        .map((element) => element.innerHtml.trim())
        .toList();

    final urlImages = html
        .querySelectorAll(
            '#popular_tab_list-0 > div > div.owl-stage-outer > div > div[class*="owl-item"] > div > a > div > div > img')
        .map((element) =>
            "https://www.incredibleindia.org/${element.attributes['data-src']!}")
        .toList();

    print('Titles Count: ${titles.length}');
    print('Images Count: ${urlImages.length}');

    setState(() {
      this.titles = titles;
      this.urlImages = urlImages;
    });
  }

  Future getPopularRoadTrips() async {
    final url = Uri.parse(
        'https://www.incredibleindia.org/content/incredible-india-v2/en.html');
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final titles = html
        .querySelectorAll(
            '#page-3e66f9114e > div > div.responsivegrid.aem-GridColumn.aem-GridColumn--default--12 > div > div.popular-tab-list.aem-GridColumn.aem-GridColumn--default--12 > section > div > div.tab-content > #popular_tab_list-1 > div > div.owl-stage-outer > div > div.owl-item > div > a > div > h2')
        .map((element) => element.innerHtml.trim())
        .toList();

    final urlImages = html
        .querySelectorAll(
            '#popular_tab_list-1 > div > div.owl-stage-outer > div > div[class*="owl-item"] > div > a > div > div > img')
        .map((element) =>
            "https://www.incredibleindia.org/${element.attributes['data-src']!}")
        .toList();

    print('Titles Count: ${titles.length}');
    print('Images Count: ${urlImages.length}');

    setState(() {
      this.titles = titles;
      this.urlImages = urlImages;
    });
  }

  Future getPopularPanIndia() async {
    final url = Uri.parse(
        'https://www.incredibleindia.org/content/incredible-india-v2/en.html');
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final titles = html
        .querySelectorAll(
            '#popular_tab_list-2 > div > div.owl-stage-outer > div > div[class*="owl-item"] > div > a > div > h2')
        .map((element) => element.innerHtml.trim())
        .toList();

    final urlImages = html
        .querySelectorAll(
            '#popular_tab_list-2 > div > div.owl-stage-outer > div > div[class*="owl-item"] > div > a > div > div > img')
        .map((element) =>
            "https://www.incredibleindia.org/${element.attributes['data-src']!}")
        .toList();

    print('Titles Count: ${titles.length}');
    print('Images Count: ${urlImages.length}');

    setState(() {
      this.titles = titles;
      this.urlImages = urlImages;
    });
  }

  @override
  void initState() {
    // fetchAllLocation();
    super.initState();
    // getPopularTwoDays();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ListTile(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text(
            "Popular Trips",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          subtitle: const Text(
            "Explore the best of India",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (int i = 0; i < 3; i++)
                    InkWell(
                      onTap: () {
                        // i == 0
                        //     ? getPopularTwoDays()
                        //     : i == 1
                        //         ? getPopularRoadTrips()
                        //         : getPopularPanIndia();
                        setState(() {
                          selectedIndex = i;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color:
                              i == selectedIndex ? Colors.yellow : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Text(
                          trips[i],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: selectedIndex == 0
                  ? popularTripsTwoDaysTitles.length
                  : selectedIndex == 1
                      ? popularTripsRoadTripsTitles.length
                      : popularTripsPanIndiaTitles.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  // onTap: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => LocationDetailsScreen(
                  //         image: selectedIndex == 0
                  //             ? popularTripsTwoDaysImages[index]
                  //             : selectedIndex == 1
                  //                 ? popularTripsRoadTripsImages[index]
                  //                 : popularTripsPanIndiaImages[index],
                  //         title: selectedIndex == 0
                  //             ? popularTripsTwoDaysTitles[index]
                  //             : selectedIndex == 1
                  //                 ? popularTripsRoadTripsTitles[index]
                  //                 : popularTripsPanIndiaTitles[index],
                  //       ),
                  //     ),
                  //   );
                  // },
                  child: LocationCard(
                    image: selectedIndex == 0
                        ? popularTripsTwoDaysImages[index]
                        : selectedIndex == 1
                            ? popularTripsRoadTripsImages[index]
                            : popularTripsPanIndiaImages[index],
                    locationName: selectedIndex == 0
                        ? popularTripsTwoDaysTitles[index]
                        : selectedIndex == 1
                            ? popularTripsRoadTripsTitles[index]
                            : popularTripsPanIndiaTitles[index], 
                    description: selectedIndex == 0
                        ? popularTripsTwoDaysDescription[index]
                        : selectedIndex == 1
                            ? popularTripsRoadTripsDescription[index]
                            : popularTripsPanOIndiaDescription[index], 
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
