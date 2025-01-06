import 'package:flutter/material.dart';
import 'package:sports_vendor_app/models/vendor.dart';
import 'package:sports_vendor_app/widgets/custom_card.dart';

class VendorCard extends StatelessWidget {
  const VendorCard({required this.vendor, required this.onTap, super.key});
  final Vendor vendor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: vendor.name,
      subtitle: 'Rating: ${vendor.rating} - Price: \$${vendor.price}',
      onTap: onTap,
    );
  }
}
