import 'package:flutter/material.dart';

class AxisAlignment extends StatelessWidget {
  const AxisAlignment({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(Icons.star, size: 60, color: Colors.amber),
          Icon(Icons.star, size: 60, color: Colors.amber),
          Icon(Icons.star, size: 60, color: Colors.amber),
        ],
      ),
    );
  }
}
