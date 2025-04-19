import 'package:flutter/material.dart';

class CustomListPage extends StatelessWidget {
  const CustomListPage({super.key});

  final List<Map<String, dynamic>> items = const [
    {
      "title": "Item 1",
      "color": Colors.pink,
      "desc": "Lorem ipsum dolor sit amet."
    },
    {
      "title": "Item 2",
      "color": Colors.green,
      "desc": "Lorem ipsum dolor sit amet."
    },
    {
      "title": "Item 3",
      "color": Colors.amber,
      "desc": "Lorem ipsum dolor sit amet."
    },
    {
      "title": "Item 4",
      "color": Colors.lightBlue,
      "desc": "Lorem ipsum dolor sit amet."
    },
    {
      "title": "Item 5",
      "color": Colors.orange,
      "desc": "Lorem ipsum dolor sit amet."
    },
    {
      "title": "Item 6",
      "color": Colors.blueAccent,
      "desc": "Lorem ipsum dolor sit amet."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemBuilder: (context, index) {
        final item = items[index];
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 6)],
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: item['color'],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item['title'],
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(item['desc'],
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 13)),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        );
      },
    );
  }
}
