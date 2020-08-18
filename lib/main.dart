import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor:
          SystemUiOverlayStyle.dark.systemNavigationBarColor,
    ),
  );
  runApp(MaterialApp(
    initialRoute: "/login",
    routes: {
      "/home": (context) => HomePage(),
      "/login": (context) => Login(),
    },
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _seleCategoryIndex = 0;
  Map categories = {"Work": 1090, "Station": 10};
  // final DateFormat _dateFormat = DateFormat('dd MMM');
  // final DateFormat _timeFormat = DateFormat('h:m');

  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  Widget _buildCategoryCard(int index, String title, int count) {
    return GestureDetector(
      onTap: () {
        _seleCategoryIndex = index;
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
        height: 240.0,
        width: 175.0,
        decoration: BoxDecoration(
            color: _seleCategoryIndex == index
                ? Color(0xff417b7b)
                : Color(0xfff5f7fb),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              _seleCategoryIndex == index
                  ? BoxShadow(
                      color: Colors.black, offset: Offset(0, 2), blurRadius: 10)
                  : BoxShadow(color: Colors.transparent)
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                title,
                style: TextStyle(
                    color: _seleCategoryIndex == index
                        ? Colors.white
                        : Color(0xffafb4c6)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                count.toString(),
                style: TextStyle(
                    color: _seleCategoryIndex == index
                        ? Colors.white
                        : Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                count.toString(),
                style: TextStyle(
                    color: _seleCategoryIndex == index
                        ? Colors.white
                        : Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end, // why start?
              children: <Widget>[
                Center(
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/victorhez.jpg"),
                        ),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Barrister Victorhez",
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 280,
            child: ListView.builder(
                scrollDirection: Axis.horizontal, //This is the secret
                itemCount: categories.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return SizedBox(
                      width: 20,
                    );
                  }
                  return _buildCategoryCard(
                      index - 1,
                      categories.keys.toList()[index - 1],
                      categories.values.toList()[index - 1]);
                }),
          ),
          TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Color(0xffafb4c6),
            indicatorColor: Color(0xff417bfb),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 4.0,
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                child: Text(
                  "Notes",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  "Important",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  "Performed",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
