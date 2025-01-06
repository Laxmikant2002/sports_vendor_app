import 'package:flutter/material.dart';
import 'package:sports_vendor_app/screens/location_list_screen.dart';
import 'package:sports_vendor_app/services/data_service.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final dataService = DataService();

    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(),
      home: LocationListScreen(dataService: dataService),
    );
  }
}
