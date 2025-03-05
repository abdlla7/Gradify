import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bottons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _page = 1;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = <Widget>[
      const SafeArea(child: Text('Settings')),
      Container(
        color: const Color(0xFF00664F),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 20),
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0D6E58),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'Search');
                              },
                              icon: SvgPicture.asset(
                                'assets/icons/search.svg',
                                color: Colors.white,
                                width: 40,
                              ))),
                    ),
                    Image.asset(
                      'assets/images/Group 29.png',
                      width: 250,
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 20),
                        child: Text('Tools',
                            style: GoogleFonts.poppins(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 5),
                        child: Text('Any thing you need',
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFBCC1CD))),
                      ),
                      const SizedBox(height: 20),
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            MyImageButton(
                              image: 'assets/images/red.png',
                              title: 'Timer',
                              icon1: 'assets/icons/timer.svg',
                              icon2: 'assets/images/ellipsis-v 2.png',
                              route: 'timer',
                            ),
                            MyImageButton(
                              image: 'assets/images/Group 10.png',
                              title: 'To do list',
                              icon1: 'assets/icons/To-do-list.svg',
                              icon2: 'assets/images/ellipsis-v 2.png',
                              route: 'timer',
                            ),
                            MyImageButton(
                              image: 'assets/images/yellow.png',
                              title: 'Note',
                              icon1: 'assets/icons/note.svg',
                              icon2: 'assets/images/ellipsis-v 2.png',
                              route: 'timer',
                            ),
                            MyImageButton(
                              image: 'assets/images/Group 9.png',
                              title: 'Calculator',
                              icon1: 'assets/icons/calculator.svg',
                              icon2: 'assets/images/ellipsis-v 2.png',
                              route: 'timer',
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, top: 20),
                        child: Text('attendance',
                            style: GoogleFonts.poppins(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 5),
                        child: Text(
                            'Just for October 6 University Technology Students',
                            style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFFBCC1CD))),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage('assets/images/green.png'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'timer');
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/icons/student.svg',
                                          color: Colors.white,
                                          width: 35),
                                      Image.asset(
                                          'assets/images/ellipsis-v 2.png',
                                          width: 35),
                                    ],
                                  ),
                                  SvgPicture.asset('assets/icons/qrcode.svg',
                                      color: Colors.white, width: 100),
                                  Text('QR code',
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      const SafeArea(child: Text('Profile')),
    ];
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 1,
        items: const <Widget>[
          Icon(Icons.settings, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.person, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: const Color(0xFF4CC591),
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 400),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: pages[_page],
    );
  }
}
