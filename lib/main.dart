import 'package:flutter/material.dart';
import 'package:flutter_tips/constant/constant.dart';
import 'package:flutter_tips/listview/custom_list_page.dart';
import 'package:flutter_tips/stateless_stateful/air_widget.dart';
import 'package:flutter_tips/stateless_stateful/batu_widget.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const ColumnRowDemo());
}

class ColumnRowDemo extends StatelessWidget {
  const ColumnRowDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(textTheme: GoogleFonts.quicksandTextTheme()),
      home: ColumnRow(),
    );
  }
}

class ColumnRow extends StatelessWidget {
  const ColumnRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primaryContent,
        title: Text(
          "Tutorial Flutter: ListView.Builder",
          style: TextStyle(
            color: ColorManager.white,
            fontSize: 16,
          ),
        ),
      ),
      body: CustomListPage(),
    );
  }
}
