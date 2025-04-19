import 'package:flutter/material.dart';
import 'package:flutter_tips/constant/constant.dart';

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    // Single column layout with cards stacked vertically
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: List.generate(
            6,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Icon(Icons.star, size: 48, color: ColorManager.primary),
                    const SizedBox(height: 16),
                    Text(
                      'Card ${index + 1}',
                      style: TextStyle(
                        fontSize: 18,
                        color: ColorManager.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
