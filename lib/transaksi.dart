import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final String url = 'http://10.0.3.2:8000/api/transaction';

Future getTransaction() async {
  var response = await http.get(Uri.parse(url));
  print(json.decode(response.body));
  return json.decode(response.body);
}

class Transaksi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    getTransaction();
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Transaksi'),
      ),
      body: FutureBuilder(
        future: getTransaction(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data['data'].length,
              itemBuilder: (context, index) {
                return Container(
                  height: 180,
                  child: Card(
                      elevation: 5,
                      child: Row(children: [
                        Column(
                          children: [
                            Text(
                              snapshot.data['data'][index]['title'],
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            Text(snapshot.data['data'][index]['type']),
                            Text(snapshot.data['data'][index]['amount'].toString()),
                          ],
                        ),
                      ])),
                );
              },
            );
          } else {
            return Text('Data error');
          }
        },
      ),
    );
  }
}
