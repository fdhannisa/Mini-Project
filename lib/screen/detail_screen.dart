import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_mini_project/model/ayat.dart';
import 'package:quran_mini_project/model/surah.dart';

class DetailScreen extends StatelessWidget {
  final int nomorSurah;
  const DetailScreen({super.key, required this.nomorSurah});

  Future<Surah> _getDetailSurah() async{
    var data = await Dio().get("https://equran.id/api/surat/$nomorSurah");
    return Surah.fromJson(json.decode(data.toString()));
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Surah>(
      future: _getDetailSurah(),
      initialData: null,
      builder: ((context, snapshot){
        if(snapshot.hasData){
          Surah surah =  snapshot.data!;
          return Scaffold(
            backgroundColor: Colors.teal,
            appBar: _appBar(context: context, surah: surah),
            body: Padding(padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView.separated(
                itemBuilder: (context, index) => _ayatItem(ayat: surah.ayat!.elementAt(index)),
                itemCount: surah.jumlahAyat, separatorBuilder: (context, index) => Container(),
              ),
            ),
          );
        } return Scaffold(
          backgroundColor: Colors.teal,
        );
      }
      ),
    );
  }
  }

AppBar _appBar({required BuildContext context, required Surah surah}) => AppBar(
  backgroundColor: Colors.white ,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: SvgPicture.asset('assets/svgs/back.svg')),
      Text(surah.namaLatin,
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal)
      ),
      IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/svgs/search.svg')),
    ],
  ),
);

Widget _ayatItem({required Ayat ayat}) => Padding(
  padding: const EdgeInsets.only(top: 24),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
              width: 27,
              height: 27,
              decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(27 / 2)),
              child: Center(
                  child: Text(
                    '${ayat.nomor}',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  )),
            ),
            const Spacer(),
            const Icon(
              Icons.share_outlined,
              color: Colors.teal,
            ),
            const SizedBox(
              width: 16,
            ),
            const Icon(
              Icons.play_arrow_outlined,
              color: Colors.teal,
            ),
            const SizedBox(
              width: 16,
            ),
            const Icon(
              Icons.bookmark_outline,
              color: Colors.teal,
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 24,
      ),
      Text(
        ayat.ar,
        style: GoogleFonts.amiri(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18),
        textAlign: TextAlign.right,
      ),
      const SizedBox(
        height: 16,
      ),
      Text(
        ayat.idn,
        style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
      )
    ],
  ),
);
