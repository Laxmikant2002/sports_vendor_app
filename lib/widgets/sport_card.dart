import 'package:flutter/material.dart';
import 'package:sports_vendor_app/models/sport.dart';
import 'package:sports_vendor_app/widgets/custom_card.dart';

class SportCard extends StatelessWidget {
  const SportCard({required this.sport, required this.onTap, super.key});
  final Sport sport;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: sport.name,
      subtitle: sport.description,
      onTap: onTap,
    );
  }
}
