import 'package:flutter/material.dart';
import 'beranda.dart' as beranda;
import 'produklist.dart' as listproduk;
import 'ui/home.dart' as Home;
import 'transaksi.dart' as transaksi;

void main() {
  runApp(new MaterialApp(
    title: "tab Bar",
    home: new MyApp(),
  ));
}

// final String url = 'http://127.0.0.1:8000/api/transaction';

// Future getTransaction() async {
//   var response = await http.get(Uri.parse(url));
//   return json.decode(response.body);
// }

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    controller = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new beranda.Beranda(),
            //new listproduk.ProdukList(),
            new Home.Home(),
            new transaksi.Transaksi(),
          ],
        ),
        bottomNavigationBar: new Material(
          color: Colors.blue,
          child: new TabBar(controller: controller, tabs: <Widget>[
            new Tab(icon: new Icon(Icons.home)),
            new Tab(icon: new Icon(Icons.list)),
            new Tab(icon: new Icon(Icons.add_chart))
          ]),
        ));
  }
}
