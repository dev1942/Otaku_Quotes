import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'emailForm.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Awesome anime Quotes',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(
        title: 'Hey My fellow Otakus Let\'s get Started!',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
   const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.vaccines),
            const SizedBox(width: 7,),
            Text(
              'Anime Quotes',
              textAlign: TextAlign.center,
              style: GoogleFonts.acme(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ), // This trailing comma makes auto-formatting nicer for build methods.
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Image.asset('otaku2.jpg',
              fit: BoxFit.contain,
            height: 200,
            width: 200,
          ),
         const SizedBox(
            height: 20.0,
          ),
          EmailForm(),
        ],
      ),
    );
  }
}


