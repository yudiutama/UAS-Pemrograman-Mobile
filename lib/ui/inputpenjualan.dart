import 'package:flutter/material.dart';
import 'package:tanistore/models/penjualan.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class InputPenjualan extends StatefulWidget {
  final Penjualan penjualan;
  InputPenjualan(this.penjualan);
  @override
  _InputPenjualanState createState() => _InputPenjualanState(this.penjualan);
}

class _InputPenjualanState extends State<InputPenjualan> {
  final _formKey = GlobalKey<FormState>();
  Penjualan penjualan;
  _InputPenjualanState(this.penjualan);
  TextEditingController nameController = TextEditingController();
  TextEditingController keteranganController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();
  TextEditingController tanggalController = TextEditingController();
  final format = DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context) {
    if (penjualan != null) {
      nameController.text = penjualan.name;
      keteranganController.text = penjualan.keterangan;
      jumlahController.text = penjualan.jumlah;
      tanggalController.text = penjualan.tanggal;
    }
    return Scaffold(
      appBar: AppBar(
        title: penjualan == null
            ? Text("Transaksi Baru")
            : Text("Update Transaksi"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextFormField(
                autocorrect: true,
                validator: (String value){
                  if (value.isEmpty){
                    return 'Mohon Isi Nama';
                  }
                  return null;
                },
                controller: nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Nama Pembeli",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(3.0))),
                onChanged: (value) {},
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: keteranganController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Keterangan",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3.0))),
                  onChanged: (value) {},
                )),
            Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: jumlahController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Jumlah",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3.0))),
                  onChanged: (value) {},
                )),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  DateTimeField(
                      format: format,
                      onShowPicker: (context, currentValue) {
                        return showDatePicker(
                            context: context,
                            firstDate: DateTime(2020),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2045));
                      },
                      decoration: InputDecoration(
                        labelText: "Tanggal",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0)),
                      ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      //color: Theme.of(context).primaryColorDark,
                      //textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        "Save",
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        if (penjualan == null) {
                          penjualan = Penjualan(
                              nameController.text,
                              keteranganController.text,
                              jumlahController.text,
                              tanggalController.text);
                        } else {
                          penjualan.name = nameController.text;
                          penjualan.keterangan = keteranganController.text;
                          penjualan.jumlah = jumlahController.text;
                          penjualan.tanggal = tanggalController.text;
                          print("ini update ya");
                        }
                        Navigator.pop(context, penjualan);
                      },
                    ),
                  ),
                  Container(
                    width: 5.0,
                  ),
                  Expanded(
                      child: ElevatedButton(
                    //color: Theme.of(context).primaryColorDark,
                    //textColor: Theme.of(context).primaryColorLight,
                    child: Text(
                      "Cancel",
                      textScaleFactor: 1.5,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
