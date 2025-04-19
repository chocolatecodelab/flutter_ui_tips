import 'package:flutter/material.dart';

class LeavePageBody extends StatefulWidget {
  const LeavePageBody({super.key});

  @override
  State<LeavePageBody> createState() => _LeavePageBodyState();
}

class _LeavePageBodyState extends State<LeavePageBody> {
  String selectedFilter = 'All';

  final List<Map<String, dynamic>> leaveData = [
    {
      'type': 'Half Day Application',
      'date': 'Wed, 16 Dec',
      'status': 'Awaiting',
      'statusColor': Colors.amber,
      'leaveType': 'Casual',
      'leaveTypeColor': Colors.amber,
      'month': 'December 2020',
    },
    {
      'type': 'Full Day Application',
      'date': 'Mon, 28 Nov',
      'status': 'Approved',
      'statusColor': Colors.green,
      'leaveType': 'Sick',
      'leaveTypeColor': Colors.blue,
      'month': 'November 2020',
    },
    {
      'type': '3 Days Application',
      'date': 'Tue, 22 Nov – Fri, 25 Nov',
      'status': 'Declined',
      'statusColor': Colors.red,
      'leaveType': 'Casual',
      'leaveTypeColor': Colors.amber,
      'month': 'November 2020',
    },
    {
      'type': 'Full Day Application',
      'date': 'Wed, 02 Nov',
      'status': 'Approved',
      'statusColor': Colors.green,
      'leaveType': 'Sick',
      'leaveTypeColor': Colors.blue,
      'month': 'November 2020',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredLeaves = selectedFilter == 'All'
        ? leaveData
        : leaveData
            .where((item) => item['leaveType'] == selectedFilter)
            .toList();

    final groupedLeaves = <String, List<Map<String, dynamic>>>{};
    for (var leave in filteredLeaves) {
      groupedLeaves.putIfAbsent(leave['month'], () => []).add(leave);
    }

    return Column(
      children: [
        // Filter Tabs
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: buildFilterBar(),
        ),

        const Divider(),

        // Leave Items
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: groupedLeaves.entries.expand((entry) {
              final month = entry.key;
              final items = entry.value;

              return [
                _buildSectionTitle(month),
                const SizedBox(height: 8),
                ...items.map((item) => Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _buildLeaveItem(
                        type: item['type'],
                        date: item['date'],
                        status: item['status'],
                        statusColor: item['statusColor'],
                        leaveType: item['leaveType'],
                        leaveTypeColor: item['leaveTypeColor'],
                      ),
                    )),
              ];
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget buildFilterBar() {
    final filters = ['All', 'Casual', 'Sick'];
    final colors = {
      'Casual': Colors.amber,
      'Sick': Colors.blue,
    };

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: filters.map((filter) {
          final isSelected = selectedFilter == filter;

          return Expanded(
            child: GestureDetector(
              onTap: () => setState(() => selectedFilter = filter),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (filter != 'All') ...[
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: colors[filter],
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                    ],
                    Text(
                      filter,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildLeaveItem({
    required String type,
    required String date,
    required String status,
    required Color statusColor,
    required String leaveType,
    required Color leaveTypeColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 8,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                type,
                style: const TextStyle(color: Colors.grey),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            date,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            leaveType,
            style: TextStyle(
              color: leaveTypeColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
