import 'package:flutter/material.dart';
import 'package:sports_vendor_app/models/location.dart';
import 'package:sports_vendor_app/screens/sports_list_screen.dart';
import 'package:sports_vendor_app/services/data_service.dart';
import 'package:sports_vendor_app/widgets/location_card.dart';

class LocationListScreen extends StatelessWidget {
  const LocationListScreen({required this.dataService, super.key});
  final DataService dataService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location List'),
      ),
      body: FutureBuilder<List<Location>>(
        future: dataService.fetchLocations(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading locations.'));
          }
          final locations = snapshot.data ?? [];
          return LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 600) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3,
                  ),
                  itemCount: locations.length,
                  itemBuilder: (context, index) {
                    return LocationCard(
                      location: locations[index],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SportsListScreen(
                              location: locations[index].name,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              } else {
                return ListView.builder(
                  itemCount: locations.length,
                  itemBuilder: (context, index) {
                    return LocationCard(
                      location: locations[index],
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SportsListScreen(
                              location: locations[index].name,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
