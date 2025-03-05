import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyImageButton extends StatelessWidget {
  final String image;
  final String title;
  final String icon1;
  final String icon2;
  final String route;

  const MyImageButton(
      {super.key,
      required this.image,
      required this.title,
      required this.icon1,
      required this.icon2,
      required this.route
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 10, top: 10),
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
        ),
        child: MaterialButton(
          onPressed: () {
            Navigator.pushNamed(context, route);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(icon1, color: Colors.white, width: 35),
                    Image.asset(icon2, width: 35),
                  ],
                ),
                Text(title,
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
