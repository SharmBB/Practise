import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:practise/Screens/Chat/chatPage.dart';
import 'package:practise/Screens/Profile/profile.dart';
import 'package:practise/Utils/Constraints.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final String email;
  HomePage({Key? key, required this.email}) : super(key: key);
  @override
  State<HomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomePage> {
  final List<Map> feild = [
    {
      'Name': 'Book Shop',
      'Image': 'assets/png/Rectangle 64.png',
      'Location': 'Jaffna'
    },
    {
      'Name': 'Fruit Shop',
      'Image': 'assets/png/Rectangle 65.png',
      'Location': 'Batti'
    },
    {'Name': 'Gift Shop', 'Image': 'assets/png/g3.jpeg', 'Location': 'Batti'},
  ];

  final List<Map<String, dynamic>> _allUsers = [
    {"id": 1, "name": "Andy", "age": 29},
    {"id": 2, "name": "Aragon", "age": 40},
    {"id": 3, "name": "Bob", "age": 5},
    {"id": 4, "name": "Barbara", "age": 35},
    {"id": 5, "name": "Candy", "age": 21},
    {"id": 6, "name": "Colin", "age": 55},
    {"id": 7, "name": "Audra", "age": 30},
    {"id": 8, "name": "Banana", "age": 14},
    {"id": 9, "name": "Caversky", "age": 100},
    {"id": 10, "name": "Becky", "age": 32},
  ];

  String? mail;

  //store the userImage in local
  void _getUserDetails() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    mail = localStorage.getString("email")!;
    print("homepagetoken" + mail!);
  }

  String? email;

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    _getUserDetails();

    email = widget.email;
    print(email);
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: <Widget>[
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()),
                        );
                      },
                      child: Image.asset(
                        "assets/png/aaru.png",
                      ),
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Welcome Home',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Sharmilan S',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.notifications),
                  onPressed: () {},
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0, top: 30),
                child: Text(
                  'Where do ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10.0, top: 5),
                child: Text(
                  "you want to go ?",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                  itemCount: feild.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        if (feild[index]['Name'] == 'Book Shop') {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => chatpage(
                                      email: mail!,
                                    )),
                          );
                        }

                        //  Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //             builder: (context) => DetailsScreen()),
                        //       );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SizedBox(width: 20),
                          Container(
                            width: screenWidth * 0.85,
                            height: screenHeight * 0.27,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image.asset(
                                feild[index]['Image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // key: ValueKey(_foundUsers[index]["id"]),

                      // margin: EdgeInsets.symmetric(vertical: 10),
                      // child: Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Image.asset(
                      //     'assets/png/g1.jpeg',
                      //   ),
                      // ),
                    );
                  }),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Ongoing Communities",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: primaryColor),
                      ),
                      Column(
                        children: [
                          InkWell(
                            highlightColor: Colors.transparent,
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) =>
                              //         Browser(),
                              //   ),
                              // );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                " Show All >",
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ])),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        fixedColor: Colors.blue,
        items: [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Cart',
            icon: Icon(Icons.bookmark),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(
              Icons.people,
            ),
          ),
        ],
      ),
    );
  }
}
