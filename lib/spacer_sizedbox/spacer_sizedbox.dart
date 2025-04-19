import 'package:flutter/material.dart';
import 'package:flutter_tips/constant/constant.dart';

class SpacerSizedBoxExample extends StatelessWidget {
  const SpacerSizedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.menu, color: ColorManager.grey),
          const SizedBox(width: 12),
          Image.asset(
            'assets/images/amazon_logo.png',
            height: 25,
            fit: BoxFit.contain,
          ),
          Spacer(),
          Icon(Icons.search, color: ColorManager.grey),
          const SizedBox(width: 16),
          Stack(
            children: [
              Icon(Icons.shopping_cart_outlined, color: ColorManager.grey),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: ColorManager.lightPrimary,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    '0',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
