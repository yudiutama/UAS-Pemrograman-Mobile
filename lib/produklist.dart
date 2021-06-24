import 'package:flutter/material.dart';
import 'detailproduk.dart';

class ProdukList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Listing")),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: <Widget>[
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                        name: "Penyiram Tanaman",
                        description:
                            "Free Ongkir || COD",
                        price: 20000,
                        image: "Penyiram.jpg",
                        star: 1,
                      )));
            },
            child: ProductBox(
                        name: "Penyiram Tanaman",
                        description:
                            "Warna Biru, Kualitas Terjamin, Harga yang terjangkau",
                        price: 20000,
                        image: "Penyiram.jpg",
                        star: 1,
            ),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                        name: "Probiotik EM4",
                        description:" Free Ongkir || Diskon 30%",
                        price: 35000,
                        image: "Probiotik.jpg",
                        star: 3,
                      )));
            },
            child: ProductBox(
              name: "Probiotik EM4",
              description:"Komposis yang baik, mengandng microba baik untuk campuran fermentasi",
              price: 35000,
              image: "Probiotik.jpg",
              star: 3,
            ),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                        name: "Sprayer",
                        description:
                            "Free Ongkir || Cashback 30%",
                        price: 10000,
                        image: "Sprayer.jpg",
                        star: 5,
                      )));
            },
            child: ProductBox(
              name: "Sprayer",
              description:
                  "Semprotan air sangat bagus, terbuat dari plastik berkualitas, 100% tahan cuaca",
              price: 10000,
              image: "Sprayer.jpg",
              star: 5,
            ),
          ),
          new GestureDetector(
            onTap: () {
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => DetailProduk(
                        name: "Bibit",
                        description:
                            "Bibit unggul, tumbuh cukup cepat, bertahan hingga 1,5 tahun",
                        price: 5000,
                        image: "Bibit.jpg",
                        star: 3,
                      )));
            },
            child: ProductBox(
              name: "Bibit",
              description:
                  "Bibit unggul, tumbuh cukup cepat, bertahan hingga 1,5 tahun",
              price: 5000,
              image: "Bibit.jpg",
              star: 3,
            ),
          )
        ],
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox(
      {Key key, this.name, this.description, this.price, this.image, this.star})
      : super(key: key);
  final String name;
  final String description;
  final int price;
  final String image;
  final int star;
  final children = <Widget>[];
  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < star; i++) {
      children.add(new Icon(
        Icons.star,
        size: 10,
        color: Colors.yellow,
      ));
    }
    return Container(
      padding: EdgeInsets.all(10),
      //height: 120
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              "assets/appimages/" + image,
              width: 150,
            ),
            Expanded(
              child: Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(this.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      Text(this.description),
                      Text("Price: " + this.price.toString(),
                          style: TextStyle(color: Colors.blueAccent)),
                      Row(children: <Widget>[
                        Row(
                          children: children,
                        )
                      ]
                    )
                  ],
                )
              ),
            )
          ]
        ),
    );
  }
}
