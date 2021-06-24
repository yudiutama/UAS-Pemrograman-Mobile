import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.lightBlue, title: Text("About")),
      body: ListView(
        children: <Widget>[
          Image.network('https://sukabumikab.go.id/portal/foto_berita/38maxresdefault.jpg'),
          Container(
            padding: EdgeInsets.all(10),
            decoration: new BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue[900], Colors.lightBlue],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tani Store: Penyedia Kebutuhan Pertanian Melalui Aplikasi',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        'Aplikasi ini menyediakan segala kebutuhan di bidang pertanian dengan kemudahan berbelanja lewat satu aplikasi saja.',
                        style: TextStyle(
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:tanistore/beranda.dart';

// void main() {
//   runApp(MaterialApp(
//     title: 'Navigation Basics',
//     home: Beranda(),
//   ));
// }

// class About extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("About"),
//       ),
//       body: Center(
//         child: Text(

//         ),
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text('Beranda'),
//         ),
//       ),
//     );
//   }
// }