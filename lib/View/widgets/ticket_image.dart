import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TicketImage extends StatelessWidget {
  const TicketImage({super.key, required this.image, required this.movieName});
  final String image;
  final String movieName;
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;

    return Container(
      width: width * 0.6,
      height: height * 0.3,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      child: Stack(
        children: [
          Positioned(
              left: width * 0.2,
              top: height * 0.22,
              child: Text(movieName,
                  style: GoogleFonts.hahmlet(
                    fontSize: 28,
                    color: Colors.white,
                  )))
        ],
      ),
    );
  }
}
