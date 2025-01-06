import 'package:flutter/material.dart';
import 'package:sports_vendor_app/models/location.dart';
import 'package:sports_vendor_app/widgets/custom_card.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({required this.location, required this.onTap, super.key});
  final Location location;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: location.name,
      subtitle: 'Tap to view sports for ${location.name}',
      onTap: onTap,
    );
  }
}
