import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(title: "Cash", img: "assets/png/cash.jpg");

  Items item2 = new Items(
    title: "Card Patyment",
    img: "assets/png/card.png",
  );
  Items item3 = new Items(
    title: "PayPal",
    img: "assets/png/paypal.png",
  );
  Items item4 = new Items(
    title: "Lanka QR",
    img: "assets/png/lankaqr.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [
      item1,
      item2,
      item3,
      item4,
    ];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: EdgeInsets.only(left: 15, right: 15),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 15,
        children: myList.map((data) {
          return Container(
            decoration: BoxDecoration(
              color: Color(color),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  data.img,
                  width: 120,
                  height: 120,
                ),
                SizedBox(height: 10),
                Text(
                  data.title,
                  style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                // Text(
                //   data.subtitle,
                //   style: GoogleFonts.openSans(
                //     textStyle: TextStyle(
                //       color: Colors.white38,
                //       fontSize: 10,
                //       fontWeight: FontWeight.w600,
                //     ),
                //   ),
                // ),

                // Text(
                //   data.event,
                //   style: GoogleFonts.openSans(
                //     textStyle: TextStyle(
                //       color: Colors.white70,
                //       fontSize: 11,
                //       fontWeight: FontWeight.w600,
                //     ),
                //   ),
                // ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Items {
  String title;
  // String subtitle;
  // String event;
  String img;
  Items({required this.title, required this.img});
}
