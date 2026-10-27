import 'package:flutter/material.dart';

void main() {
  runApp(Tes());
}

class Tes extends StatelessWidget {
  final List<String> menu = ["Soto", "Rawon"];
  final List<int> harga = [10000, 15000];
  final List<String> porsi = ["1 porsi", "1 porsi"];
  final List<String> gambar = [
    "assets/soto.jpg",
    "assets/rawon.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.pink.shade50,
        appBar: AppBar(
          title: Text(
            "Menu Makanan",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.pink.shade300,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Table(
              border: TableBorder.all(
                color: Colors.pink.shade200,
                width: 1.5,
                borderRadius: BorderRadius.circular(8),
              ),
              columnWidths: {
                0: FlexColumnWidth(0.6),
                1: FlexColumnWidth(1.5),
                2: FlexColumnWidth(1.1),
                3: FlexColumnWidth(1.3),
                4: FlexColumnWidth(1.1),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.pink.shade100,
                  ),
                  children: [
                    header("No"),
                    header("Gambar"),
                    header("Menu"),
                    header("Harga"),
                    header("Porsi"),
                  ],
                ),
                for (int i = 0; i < menu.length; i++)
                  TableRow(
                    children: [
                      isi("${i + 1}"),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            gambar[i],
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      isi(menu[i]),
                      isi(
                        "Rp ${harga[i].toString()}",
                      ),
                      isi(porsi[i]),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget header(String teks) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 3,
      ),
      child: Text(
        teks,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.pink.shade900,
        ),
      ),
    );
  }

  Widget isi(String teks) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 3,
      ),
      child: Text(
        teks,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12,
          color: Colors.black87,
        ),
      ),
    );
  }
}
