import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../tab/surah_tab.dart';
import '../tab/juz_tab.dart';
import '../tab/book_mark_tab.dart';

class BacaQuran extends StatelessWidget {
  const BacaQuran({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: _appBar(context: context),
      body: DefaultTabController(
        length: 3,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: NestedScrollView(headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              shape: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3))
              ),
              backgroundColor: Colors.teal,
              bottom: PreferredSize(
                  preferredSize: Size.fromHeight(0),
                  child: _tab()
              ),
            ),
          ],
            body: const TabBarView(
              children: [SurahTab(), JuzTab(), BookMark()],
            ),
          ),
        ),
      ),
    );
  }
}

AppBar _appBar({required BuildContext context}) => AppBar(
  backgroundColor: Colors.white ,
  title: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(onPressed: (){
        Navigator.pop(context);
      }, icon: SvgPicture.asset('assets/svgs/back.svg')),
      Text('BACA QURAN',
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal)
      ),
      IconButton(onPressed: (){
      }, icon: SvgPicture.asset('assets/svgs/search.svg')),
    ],   
  ),
);

TabBar _tab() {
  return TabBar(labelColor: Colors.white, indicatorColor: Colors.teal, indicatorWeight: 3,
    tabs: [
      _tabItem(label: "SURAH"),
      _tabItem(label: "JUZ"),
      _tabItem(label: "BOOKMARK"),
    ],
  );
}

Tab _tabItem({required String label}) {
  return Tab(child: Text(label, style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w600),),
  );
}