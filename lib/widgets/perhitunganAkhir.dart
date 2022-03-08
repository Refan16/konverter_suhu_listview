import 'package:flutter/material.dart';

class perhitunganAkhir extends StatelessWidget {
  const perhitunganAkhir({
    Key? key,
    required this.hasilPerhitungan,
  }) : super(key: key);

  final double hasilPerhitungan;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$hasilPerhitungan",
      style: TextStyle(fontSize: 30),
    );
  }
}
