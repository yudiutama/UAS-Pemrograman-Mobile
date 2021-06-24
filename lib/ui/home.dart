import 'package:flutter/material.dart';
import 'package:tanistore/ui/inputpenjualan.dart';
import 'package:tanistore/models/penjualan.dart';
import 'package:tanistore/helpers/dbhelper.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Penjualan> penjualanList;

  @override
  Widget build(BuildContext context) {
    if (penjualanList == null) {
      // ignore: deprecated_member_use
      penjualanList = List<Penjualan>();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Data'),
      ),
      body: createListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Input Penjualan',
        onPressed: () async {
          var penjualan = await navigateToEntryFrom(context, null);
          if (penjualan != null) addPenjualan(penjualan);
        },
      ),
    );
  }

  Future<Penjualan> navigateToEntryFrom(BuildContext context, Penjualan penjualan) async 
  {
    var result = await Navigator.push(
      context,
        MaterialPageRoute(
          builder: (BuildContext context) {
          return InputPenjualan(penjualan);
          }
      )
    );
    return result;
  
    ListView createListView() {
      TextStyle textStyle = Theme.of(context).textTheme.subtitle1;
      return ListView.builder(
          itemCount: count,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                  title: Text(this.penjualanList[index].name,style: textStyle,),
                  subtitle: Row(
                    children: <Widget>[
                      Text(this.penjualanList[index].tanggal),
                      Text(" | Rp. "+this.penjualanList[index].jumlah,style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                  trailing: GestureDetector(
                      child: Icon(Icons.delete),
                      onTap: () {
                        deletePenjualan(penjualanList[index]);
                      }),
                  onTap: () async {
                    var penjualan = await navigateToEntryFrom(
                        context, this.penjualanList[index]);
                    if (penjualan != null) editPenjualan(penjualan);
                  },
                ),
              );
            },
          );
        }
      }

        void editPenjualan(Penjualan object) async {
          int result = await dbHelper.insert(object);
          if (result > 0) {
            updateListView();
          }
        }

        void addPenjualan(Penjualan object) async {
          int result = await dbHelper.insert(object);
          if (result > 0) {
            updateListView();
            print("ini edit Penjualan RESULT $result");
          }
        }

        void deletePenjualan(Penjualan object) async {
          int result = await dbHelper.delete(object.id);
          if (result > 0) {
            updateListView();
          }
        }

        void updateListView() {
          final Future<Database> dbFuture = dbHelper.initDb();
          dbFuture.then((database) {
            Future<List<Penjualan>> penjualanListFuture = dbHelper.getPenjualanList();
            penjualanListFuture.then((penjualanList) {
              setState(() {
                this.penjualanList = penjualanList;
                this.count = penjualanList.length;
              });
            });
          });
        }

        createListView() {}
      }