import 'package:flutter/material.dart';
import 'package:flutter_tips/constant/constant.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Sidebar
        Container(
          width: 250,
          color: ColorManager.primary,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(Icons.desktop_windows, size: 80, color: ColorManager.white),
              const SizedBox(height: 20),
              Text(
                'Desktop View\n(> 1200)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: ColorManager.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 40),
              _buildSidebarItem(Icons.dashboard, 'Dashboard'),
              _buildSidebarItem(Icons.person, 'Profile'),
              _buildSidebarItem(Icons.settings, 'Settings'),
              _buildSidebarItem(Icons.help, 'Help'),
            ],
          ),
        ),
        // Main Content
        Expanded(
          child: Container(
            color: ColorManager.lightGrey.withOpacity(0.1),
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dashboard Overview',
                  style: TextStyle(
                    fontSize: 28,
                    color: ColorManager.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return Container(
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _getIcon(index),
                              size: 48,
                              color: ColorManager.primary,
                            ),
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
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSidebarItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: ColorManager.white),
        title: Text(
          title,
          style: TextStyle(color: ColorManager.white),
        ),
        onTap: () {},
      ),
    );
  }

  IconData _getIcon(int index) {
    final icons = [
      Icons.home,
      Icons.bar_chart,
      Icons.people,
      Icons.folder,
      Icons.calendar_today,
      Icons.message,
    ];
    return icons[index % icons.length];
  }
}
