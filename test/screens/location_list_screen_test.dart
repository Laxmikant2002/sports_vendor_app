import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sports_vendor_app/models/location.dart';
import 'package:sports_vendor_app/screens/location_list_screen.dart';
import 'package:sports_vendor_app/services/data_service.dart';

class MockDataService extends Mock implements DataService {}

void main() {
  late MockDataService mockDataService;

  setUp(() {
    mockDataService = MockDataService();
    // Register fallback values for Location
    registerFallbackValue(Location(id: '0', name: 'Fallback Location'));
  });

  testWidgets('LocationListScreen displays locations',
      (WidgetTester tester) async {
    final locations = [
      Location(id: '1', name: 'Location 1'),
      Location(id: '2', name: 'Location 2'),
    ];

    when(() => mockDataService.fetchLocations())
        .thenAnswer((_) async => locations);

    await tester.pumpWidget(
      MaterialApp(
        home: LocationListScreen(dataService: mockDataService),
      ),
    );

    await tester.pumpAndSettle(); // Wait for the FutureBuilder to complete

    expect(find.text('Location 1'), findsOneWidget);
    expect(find.text('Location 2'), findsOneWidget);
  });

  testWidgets('LocationListScreen shows loading indicator while fetching data',
      (WidgetTester tester) async {
    when(() => mockDataService.fetchLocations())
        .thenAnswer((_) async => Future.delayed(const Duration(seconds: 2)));

    await tester.pumpWidget(
      MaterialApp(
        home: LocationListScreen(dataService: mockDataService),
      ),
    );

    await tester.pump(); // Trigger the frame

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('LocationListScreen shows error message on error',
      (WidgetTester tester) async {
    when(() => mockDataService.fetchLocations())
        .thenThrow(Exception('Error fetching locations'));

    await tester.pumpWidget(
      MaterialApp(
        home: LocationListScreen(dataService: mockDataService),
      ),
    );

    await tester.pumpAndSettle(); // Wait for the FutureBuilder to complete

    expect(find.text('Error loading locations.'), findsOneWidget);
  });
}
