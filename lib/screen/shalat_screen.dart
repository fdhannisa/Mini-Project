import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adhan/adhan.dart';
import 'package:intl/intl.dart';

class Shalat extends StatefulWidget {
  @override
  _ShalatState createState() => _ShalatState();
}

class _ShalatState extends State<Shalat> {

  PrayerTimes getPrayerTimes() {
    final myCoordinates = Coordinates(23.9088, 89.1220);  //belum menggunakan koordinat sesuai posisi device
    final date = DateComponents.from(DateTime.now());
    final params = CalculationMethod.karachi.getParameters();
    params.madhab = Madhab.hanafi;
    return PrayerTimes.today(myCoordinates, params);
  }

  @override
  Widget build(BuildContext context) {
    var prayerTimes = getPrayerTimes();
    var dateFormat = DateFormat.jm();

    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: _appBar(context: context),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subuh', style: TextStyle(fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
                Text('${dateFormat.format(prayerTimes.fajr)}', style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
              ],
            ),
            Divider(color: Colors.white,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Zuhur', style: TextStyle(fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
                Text('${dateFormat.format(prayerTimes.dhuhr)}', style: TextStyle(fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
              ],
            ),
            Divider(color: Colors.white,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Ashar', style: TextStyle(fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
                Text('${dateFormat.format(prayerTimes.asr)}', style: TextStyle(fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
              ],
            ),
            Divider(color: Colors.white,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Maghrib', style: TextStyle(fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
                Text('${dateFormat.format(prayerTimes.maghrib)}', style: TextStyle(fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
              ],
            ),
            Divider(color: Colors.white,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Isya', style: TextStyle(fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
                Text('${dateFormat.format(prayerTimes.isha)}', style: TextStyle(fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
              ],
            ),
            Divider(color: Colors.white,),
          ],
        ),
      ),
    );
  }


  AppBar _appBar({required BuildContext context}) =>
      AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {
              Navigator.pop(context);
            }, icon: SvgPicture.asset('assets/svgs/back.svg')),
            Text('WAKTU SHALAT',
                style: GoogleFonts.poppins(fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal)
            ),
            IconButton(onPressed: () {},
                icon: SvgPicture.asset('assets/svgs/sholat.svg')),
          ],
        ),
      );
}

