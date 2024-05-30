import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ghumakkad_2/helpers/error_handling.dart';
import 'package:ghumakkad_2/models/location_model.dart';
import 'package:ghumakkad_2/utils/showSnackBar.dart';
import 'package:ghumakkad_2/utils/constants.dart';
import 'package:http/http.dart' as http;

class SearchServices {
  Future<List<LocationModel>> fetchSearchedLocation({
    required BuildContext context,
    required String searchQuery,
  }) async {
    List<LocationModel> locationList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/api/locations/search/$searchQuery'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            locationList.add(
              LocationModel.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return locationList;
  }

}