import 'package:flutter/material.dart';
import 'package:flutter_tips/constant/constant.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key});

  @override
  Widget build(BuildContext context) {
    // Two columns per row layout
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            for (var i = 0; i < 6; i += 2)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
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
                            Icon(Icons.star,
                                size: 48, color: ColorManager.primary),
                            const SizedBox(height: 16),
                            Text(
                              'Card ${i + 1}',
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
                    const SizedBox(width: 16),
                    if (i + 1 < 6)
                      Expanded(
                        child: Container(
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
                              Icon(Icons.star,
                                  size: 48, color: ColorManager.primary),
                              const SizedBox(height: 16),
                              Text(
                                'Card ${i + 2}',
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
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
