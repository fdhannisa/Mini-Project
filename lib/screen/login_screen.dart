import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran_mini_project/screen/home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

  class _LoginPageState extends State<LoginPage> {
  var formKey = GlobalKey<FormState>();
  var inputControllerNama = TextEditingController();
  var inputControllerPassword = TextEditingController();

    @override
    Widget build(BuildContext){
      return Scaffold(
        backgroundColor: Colors.teal,
        body:Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Selamat Datang Kembali',
                    style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Membaca Al-Quran adalah kegiatan yang penuh kedamaian dan keberkahan, menyatu dengan makna-makna ilahi yang memberi cahaya bagi hati dan jiwa.',
                  maxLines: 3,
                  style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 16)
                  ),
                SizedBox(
                  height: 25,
                ),

                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.person, color: Colors.white
                    ),
                    hintText: 'Username',hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.normal, color: Colors.white) ,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                TextFormField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.lock, color: Colors.white
                    ),
                    hintText: 'Password',hintStyle: GoogleFonts.poppins(fontWeight: FontWeight.normal, color: Colors.white) ,
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                SizedBox(
                  height: 40,
                  width: 400,
                  child: ElevatedButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange)
                    ),
                    child:Text('Masuk', style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),

          ),)
      );
    }
  }