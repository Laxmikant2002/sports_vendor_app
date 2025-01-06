import 'package:flutter/material.dart';
import 'package:sports_vendor_app/models/sport.dart';
import 'package:sports_vendor_app/services/data_service.dart';
import 'package:sports_vendor_app/widgets/sport_card.dart';
import 'package:sports_vendor_app/screens/event_screen.dart';
import 'package:sports_vendor_app/utils/constants.dart';

class SportsListScreen extends StatelessWidget {
  const SportsListScreen({required this.location, super.key});
  final String location;

  @override
  Widget build(BuildContext context) {
    final dataService = DataService();

    return Scaffold(
      appBar: AppBar(
        title: Text('Sports List for $location'),
      ),
      body: FutureBuilder<List<Sport>>(
        future: dataService.fetchSports(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading sports.'));
          }
          final sports = snapshot.data ?? [];
          return ListView.builder(
            itemCount: sports.length,
            itemBuilder: (context, index) {
              return SportCard(
                sport: sports[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventScreen(
                        vendorName: 'Vendor ${index + 1}',
                        numberOfTickets: defaultTickets,
                        personName: defaultName,
                        ageRate: defaultAgeRate,
                        pay: defaultTicketPrice,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
