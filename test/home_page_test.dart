import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quran_mini_project/screen/baca_quran_screen.dart';
import 'package:quran_mini_project/screen/home_screen.dart';
import 'package:quran_mini_project/screen/shalat_screen.dart';

void main() {
  testWidgets('Uji UI HomeScreen', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: HomeScreen()));

    //Verify the initial UI of the HomeScreen
    expect(find.text('Quran App'), findsOneWidget);
    expect(find.text('BACA QURAN'), findsOneWidget);
    expect(find.text('TERAKHIR BACA'), findsOneWidget);
    expect(find.text('WAKTU SHOLAT'), findsOneWidget);

   // Tap the 'BACA QURAN' button
    await tester.tap(find.text('BACA QURAN'));
    await tester.pumpAndSettle();

    // verifikasi jika button Baca Quran di pencet akan pindah halaman
    expect(find.byType(BacaQuran), findsOneWidget);

    //Tap the 'WAKTU SHOLAT' button
    await tester.tap(find.text('WAKTU SHOLAT'));
    await tester.pumpAndSettle();

    // verifikasi jika button Waktu Sholat di pencet akan pindah halaman
    expect(find.byType(Shalat), findsOneWidget);

  });
}
