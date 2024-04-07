import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_mini_project/screen/home_screen.dart';
import 'package:quran_mini_project/screen/login_screen.dart';

void main() {
  testWidgets('Uji UI LoginPage', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginPage()));

    // Verify the initial UI of the LoginPage
    expect(find.text('Selamat Datang Kembali'), findsOneWidget);
    expect(find.text('Membaca Al-Quran adalah kegiatan yang penuh kedamaian dan keberkahan, menyatu dengan makna-makna ilahi yang memberi cahaya bagi hati dan jiwa.'), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Masuk'), findsOneWidget);

    // Coba inputkan nilai
    await tester.enterText(find.byType(TextFormField).at(0), 'Username');
    await tester.enterText(find.byType(TextFormField).at(1), 'Password');

    // Tap the 'Masuk' button
    await tester.tap(find.text('Masuk'));
    await tester.pumpAndSettle();

    // verifikasi jika di pencet pindah halaman
    expect(find.byType(HomeScreen), findsOneWidget);


  });
}
