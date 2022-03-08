import 'package:flutter/material.dart';
import 'package:konverter_suhu_listview/widgets/inputSuhu.dart';
import 'package:konverter_suhu_listview/widgets/perhitunganAkhir.dart';
import 'package:konverter_suhu_listview/widgets/riwayatPerhitungan.dart';
import 'package:konverter_suhu_listview/widgets/targetPerhitungan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = TextEditingController();
  String selectedDropdown = "Kelvin";
  List<String> listSatuanSuhu = ["Kelvin", "Reamur", "Fahrenheit"];
  double hasilPerhitungan = 0;
  List<String> listHasil = [];

  void onDropdownChanged(Object? value) {
    return setState(() {
      selectedDropdown = value.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Konverter Suhu"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              inputSuhu(etInput: etInput),
              SizedBox(height: 8),
              targetPerhitungan(
                selectedDropdown: selectedDropdown,
                listSatuanSuhu: listSatuanSuhu,
                onDropdownChanged: onDropdownChanged,
              ),
              const SizedBox(height: 8),
              const Text(
                "Hasil",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 8),
              perhitunganAkhir(hasilPerhitungan: hasilPerhitungan),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (etInput.text.isNotEmpty) {
                            switch (selectedDropdown) {
                              case "Kelvin":
                                hasilPerhitungan =
                                    int.parse(etInput.text) + 273;
                                break;
                              case "Reamur":
                                hasilPerhitungan =
                                    int.parse(etInput.text) * 4 / 5;
                                break;
                              case "Fahrenheit":
                                hasilPerhitungan =
                                    int.parse(etInput.text) * 9 / 5 + 32;
                                break;
                            }
                            listHasil.add("Konversi dari " +
                                etInput.text +
                                " Celcius ke " +
                                selectedDropdown +
                                " dengan hasil : " +
                                hasilPerhitungan.toString());
                          }
                        });
                      },
                      child: Text("Konversi Suhu"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "Riwayat Konversi",
                style: TextStyle(fontSize: 20),
              ),
              riwayatPerhitungan(listHasil: listHasil),
            ],
          ),
        ),
      ),
    );
  }
}
