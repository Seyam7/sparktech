import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  final List<String> _filterLabels = ['All', '中文', 'English', 'Maths', 'Chemistry'];
  String _selectedFilter = 'All';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _filterLabels.length,
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final isSelected = _filterLabels[index] == _selectedFilter;
          return GestureDetector(
            onTap: () =>
                setState(
                        () => _selectedFilter = _filterLabels[index],
                ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xFFE3F2FD) : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              alignment: Alignment.center,
              child: Text(
                _filterLabels[index],
                style: TextStyle(
                  color: isSelected ? const Color(0xFF0D47A1) : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
