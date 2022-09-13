import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  //dynamic val = [false, false, false];
  late TabController _tabController;
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);
  }

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.green,
            onPressed: () {},
          ),
          body: TabBarView(controller: _tabController, children: [
            HomePage(),
            MyWebView(
                title: "DigitalOcean",
                selectedUrl: "https://www.digitalocean.com"),
            CalCal()
          ]),
          bottomNavigationBar: BottomAppBar(
            elevation: 100,
            child: Container(
                color: Colors.black,
                height: 60,
                child: TabBar(controller: _tabController, tabs: [
                  Text("Home"),
                  Text("Events"),
                  Text("Oranganization"),
                ])),
          ),
        ));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Center(
          //   child: CircleChart(
          //       progressNumber: 4,
          //       maxNumber: 10,
          //       progressColor: Color.fromARGB(0, 49, 50, 139),
          //       children: [
          //         Icon(Icons.arrow_upward),
          //         Text(
          //           'This is kind of circle chart.',
          //         ),
          //       ]),
          // ),
          CircularPercentIndicator(
            radius: 100.0,
            lineWidth: 10.0,
            animation: true,
            percent: 50 / 100,
            center: Text(
              50.toString() + "%" + "\n" + "250/500",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            backgroundColor: Color.fromARGB(255, 217, 207, 207),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.redAccent,
          ),
          Text("Weekly Chart"),
          Container(
            child: Column(
              children: [
                Row(
                  children: [Text("12/08/2022"), Text("500/540")],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                Row(
                  children: [Text("Chicken Tenders"), Text("300")],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                Row(
                  children: [Text("Meals"), Text("300")],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [Text("12/08/2022"), Text("500/540")],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                Row(
                  children: [Text("Chicken Tenders"), Text("300")],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                Row(
                  children: [Text("Meals"), Text("300")],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [Text("12/08/2022"), Text("500/540")],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                Row(
                  children: [Text("Chicken Tenders"), Text("300")],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                Row(
                  children: [Text("Meals"), Text("300")],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyWebView extends StatelessWidget {
  final String title;
  final String selectedUrl;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  MyWebView({
    required this.title,
    required this.selectedUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebView(
        initialUrl: selectedUrl,
      ),
    );
  }
}

class CalCal extends StatefulWidget {
  const CalCal({Key? key}) : super(key: key);

  @override
  State<CalCal> createState() => _CalCalState();
}

class _CalCalState extends State<CalCal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButton(
            child: Text("Photo"),
            onPressed: () {},
          ),
          ElevatedButton(
            child: Text("Search item"),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Item()));
            },
          )
        ],
      ),
    );
  }
}

class Item extends StatefulWidget {
  const Item({Key? key}) : super(key: key);

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  int coun = 0;
  var textController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            child: TextFormField(
              controller: textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Item Name',
                hintText: 'Enter Your Name',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Calorie',
                hintText: 'Calorie',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Text("Quantity"),
                Expanded(child: SizedBox()),
                IconButton(
                    onPressed: () {
                      setState(() {
                        coun--;
                      });
                    },
                    icon: Icon(Icons.remove)),
                Text("$coun"),
                IconButton(
                    onPressed: () {
                      setState(() {
                        coun++;
                      });
                    },
                    icon: Icon(Icons.add)),
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(
                              title: "As",
                            )));
              },
              child: Text("Submit"))
        ],
      ),
    );
  }
}
