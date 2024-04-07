import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_mini_project/screen/baca_quran_screen.dart';
import 'package:quran_mini_project/screen/shalat_screen.dart';


class HomeScreen extends StatelessWidget{

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: _appBar(),


      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 300,
                height: 50,
                child:  OutlinedButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BacaQuran()),
                  );
                },
                  child: Text(
                    'BACA QURAN',
                    style: TextStyle(
                      fontSize: 16, color: Colors.white,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: Colors.white,
                          width: 5
                      )
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 300,
                height: 50,
                child:  OutlinedButton(onPressed: () {},
                  child: Text(
                    'TERAKHIR BACA',
                    style: TextStyle(
                      fontSize: 16, color: Colors.white,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: Colors.white,
                          width: 5
                      )
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 300,
                height: 50,
                child:  OutlinedButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Shalat()),
                  );
                },
                  child: Text(
                    'WAKTU SHOLAT',
                    style: TextStyle(
                      fontSize: 16, color: Colors.white,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(
                          color: Colors.white,
                          width: 5
                      )
                  ),
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
}

AppBar _appBar() => AppBar(
  backgroundColor: Colors.white ,
  title:Align(
    alignment: Alignment.center,
     child: Text('Quran App',
          style: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal))
  ),
);






