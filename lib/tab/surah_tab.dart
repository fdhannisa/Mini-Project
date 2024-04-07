import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_mini_project/model/surah.dart';
import 'package:quran_mini_project/screen/detail_screen.dart';

class SurahTab extends StatelessWidget{
  const SurahTab({super.key});

  Future <List<Surah>> _getSurahList() async{
    //rootBundle untuk mengambil data yang ada pada json
    String data = await rootBundle.loadString('lib/model/list_surah.json');
    return surahFromJson(data);
  }
  @override
  Widget build(BuildContext context){
    return FutureBuilder<List<Surah>>(
        future: _getSurahList(),
        initialData: [],
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.separated(itemBuilder: (
                context, index) => _surahItem(context: context, surah: snapshot.data!.elementAt(index)),
                separatorBuilder: (context, index) => Divider(color: Colors.white.withOpacity(0.55)
                ),
                itemCount: snapshot.data!.length);
          } return Container();

          });
  }
}

Widget _surahItem({required Surah surah, required BuildContext context}) => GestureDetector(
  behavior: HitTestBehavior.opaque,
  onTap: () {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailScreen(nomorSurah: surah.nomor,)));
  },
    child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Stack(
              children: [
                SvgPicture.asset('assets/svgs/nomor.svg', color: Colors.white),
                SizedBox(
                  height: 36,
                    width: 36,
                  child: Center(child: Text('${surah.nomor}', style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500),),
                  ),
                ),
              ],
            ),

        SizedBox(
          width: 16,
        ),

        Expanded(child:
        Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(surah.namaLatin,
            style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
          ),

            SizedBox(
              height: 4,
            ),

            Row(children: [
              Text(surah.tempatTurun.name,
                style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
              ),

              SizedBox(
                width: 5,
              ),

              Container(width: 4, height: 4, decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: Colors.white),
              ),

              SizedBox(
                width: 5,
              ),

              Text('${surah.jumlahAyat} ayat',
                style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
              ),
          ],
          ),
      ],
       ),
      ),

      Text(
        surah.nama,
        style: GoogleFonts.amiri(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ],
  ),
),
);