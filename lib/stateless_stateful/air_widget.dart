import 'package:flutter/material.dart';

class AirWidget extends StatefulWidget {
  const AirWidget({super.key});
  @override
  AirWidgetState createState() => AirWidgetState();
}

class AirWidgetState extends State<AirWidget> {
  int jumlah = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      height: 100,
      width: double.infinity,
      child: Column(
        children: [
          Text("Jumlah: $jumlah", style: TextStyle(fontSize: 24)),
          SizedBox(height: 10),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ))),
            onPressed: () => setState(() => jumlah++),
            child: Text("Tambah",
                style: TextStyle(fontSize: 24, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
