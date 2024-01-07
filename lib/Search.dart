import 'package:flutter/material.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({super.key, required List<bool> selectedItems, required String searchTerm});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
class SearchScreen extends StatelessWidget {
  final List<bool> selectedItems;
  final String searchTerm;

  SearchScreen({required this.selectedItems, required this.searchTerm});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Screen'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Search Term: $searchTerm'),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Selected Items: $selectedItems'),
          ),
          // Add additional search screen UI components here
          
        ],
      ),
    );
  }
}