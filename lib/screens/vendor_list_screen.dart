import 'package:flutter/material.dart';
import 'package:sports_vendor_app/models/vendor.dart';
import 'package:sports_vendor_app/services/data_service.dart';
import 'package:sports_vendor_app/widgets/vendor_card.dart';
import 'package:sports_vendor_app/screens/event_screen.dart';
import 'package:sports_vendor_app/utils/constants.dart';

class VendorListScreen extends StatelessWidget {
  const VendorListScreen({required this.sport, super.key});
  final String sport;

  @override
  Widget build(BuildContext context) {
    final dataService = DataService();

    return Scaffold(
      appBar: AppBar(
        title: Text('Vendors for $sport'),
      ),
      body: FutureBuilder<List<Vendor>>(
        future: dataService.fetchVendors(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text('Error loading vendors.'));
          }
          final vendors = snapshot.data ?? [];
          return ListView.builder(
            itemCount: vendors.length,
            itemBuilder: (context, index) {
              return VendorCard(
                vendor: vendors[index],
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventScreen(
                        vendorName: vendors[index].name,
                        numberOfTickets: defaultTickets,
                        personName: defaultName,
                        ageRate: defaultAgeRate,
                        pay: vendors[index].price,
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
