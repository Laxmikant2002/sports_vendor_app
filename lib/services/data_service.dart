import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sports_vendor_app/models/location.dart';
import 'package:sports_vendor_app/models/sport.dart';
import 'package:sports_vendor_app/models/vendor.dart';

class DataService {
  Future<List<Location>> fetchLocations() async {
    final response = await rootBundle.loadString('assets/locations.json');
    final data = json.decode(response) as List<dynamic>;
    return data
        .map((json) => Location.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<Sport>> fetchSports() async {
    final response = await rootBundle.loadString('assets/sports.json');
    final data = json.decode(response) as List<dynamic>;
    return data
        .map((json) => Sport.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  Future<List<Vendor>> fetchVendors() async {
    final response = await rootBundle.loadString('assets/vendors.json');
    final data = json.decode(response) as List<dynamic>;
    return data
        .map((json) => Vendor.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
