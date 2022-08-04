import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:practise/Utils/Constraints.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  final List<Map> feild = [
    {'Name': 'Book Shop', 'Image': 'assets/png/g1.jpeg', 'Location': 'Jaffna'},
    {'Name': 'Fruit Shop', 'Image': 'assets/png/g2.jpeg', 'Location': 'Batti'},
       {'Name': 'Gift Shop', 'Image': 'assets/png/g3.jpeg', 'Location': 'Batti'},
  ];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
           backgroundColor: Colors.red,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text('Our Shops'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        width: screenWidth * 1,
        // height: screenHeight * 0.3,
        child: ListView.builder(
          // scrollDirection: Axis.vertical,
          itemCount: feild.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                //  Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => DetailsScreen()),
                //       );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 20),
                  Container(
                    width: screenWidth * 0.85,
                    height: screenHeight * 0.3,
                    child: Image.asset(
                      feild[index]['Image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 38.0),
                        child: Text(
                          feild[index]['Name'],
                          style: TextStyle(
                              color: kPrimaryDarkColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 38.0),
                        child: Text(
                          "Location :" + feild[index]['Location'],
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 16,
                            ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                ],
              ),
            );
          },
          //    SizedBox(height: 70),
        ),
        //    SizedBox(height: 70),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        fixedColor: Colors.orange,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            icon: Icon(Icons.shopping_cart),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.people),
          ),
        ],
      ),
    );
  }
}
