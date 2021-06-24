import 'package:flutter/material.dart';
import 'package:tanistore/about.dart';
import 'package:tanistore/produklist.dart';
import 'produklist.dart' as listproduk;


class Beranda extends StatefulWidget {
  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text('Beranda'),
        ]),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_active),
            onPressed: () {
              print('click start');
            },
          ),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Komang Yudi Utama", style: new TextStyle(fontSize: 15.0,color: Colors.white, fontWeight: FontWeight.bold),),
              accountEmail: new Text("yudi.utama@undiksha.ac.id", style: new TextStyle(color: Colors.white),),
              currentAccountPicture: new GestureDetector(
                onTap: () {},
                child: new CircleAvatar(
                  backgroundImage:
                      new NetworkImage('https://i.ibb.co/b6zZ5vZ/Foto-3x4.png'),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: new NetworkImage('https://p4.wallpaperbetter.com/wallpaper/687/185/231/blue-purple-color-blur-wallpaper-preview.jpg'), fit: BoxFit.cover), //
              ),
            ),
            new ListTile(
                title: new Text('About'),
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => About()));
                }),
            Divider(
              height: 2,
            ),
          ],
        ),
      ),
      body: new ListView(children: <Widget>[
        new Image(
          image: new NetworkImage(
              "https://poktanjulitani.com/assets/images/about.jpg"),
        ),
        //Image.asset("appimages/tani1.jpg"),
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Theme.of(context).dividerColor)),
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: new BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [Colors.grey[50], Colors.grey[50]],
            ),
            //borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Penuhi Kebutuhan Anda Hanya di TaniStore, Ayo Belanja...',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        new GestureDetector(
            child: Center(
                child: ElevatedButton(
                    child: Text('Cek Produk'),
                    onPressed: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (BuildContext context) => ProdukList()));
                    }))),
      ]),
    );
  }
}
