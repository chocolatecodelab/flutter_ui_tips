import "package:flutter/material.dart";

class BatuWidget extends StatelessWidget {
  const BatuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print("Build ulang");
    return Container(
        width: double.infinity,
        height: 100,
        color: Colors.blue,
        child: Center(
          child: Text(
            "Batu",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
