import 'package:flutter/material.dart';

void main() {
  runApp(const RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RestaurantHomePage(),
    );
  }
}

class RestaurantHomePage extends StatefulWidget {
  const RestaurantHomePage({super.key});

  @override
  _RestaurantHomePageState createState() => _RestaurantHomePageState();
}

class _RestaurantHomePageState extends State<RestaurantHomePage> {
  List<bool> selectedItems = List.generate(7, (index) => false);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sahal Restaurant'),
        centerTitle: true,

        leading: IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/restaurant_logo.png',
              height: 200,
              width: 200,
              fit: BoxFit.cover,
              repeat: ImageRepeat.repeat,
            )),
        actions: [
          IconButton(
            icon: const Icon(Icons.info,
                color: Color.fromARGB(235, 230, 142, 19)),
            onPressed: () {
              // Implement your about functionality
              showAboutDialog(
                context: context,
                applicationName: 'Sahal Restaurant',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(Icons.restaurant),
                applicationLegalese: 'Copyright © 2024 Sahal Restaurant',
                children: [
                  const Text(
                      'Sahal Restaurant is a food ordering app developed by Mohamed Sheikh.'),
                  const Text(
                      'Sahal Restaurant is developed by Mohamed Sheikh.'),
                ],
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications,
                color: Color.fromARGB(235, 230, 142, 19)),
            onPressed: () {
              // Implement your notification functionality

              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content:
                      Text('14 notifications received from the restaurant')));
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Image.asset(
          //     'assets/restaurant_logo.png',
          //     height: 80,
          //     width: 80,
          //   ),
          // ),
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    // Toggle selection when the item is tapped
                    setState(() {
                      selectedItems[index] = !selectedItems[index];
                    });
                  },
                  tileColor: selectedItems[index]
                      ? Colors.blue.withOpacity(0.3)
                      : null,
                  title: Image.asset(
                    'assets/$index.png',
                    height: 200,
                    width: 200,
                    fit: BoxFit.scaleDown,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Search',
                hintText: 'Type here to search...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Navigate to the search screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(
                    selectedItems: selectedItems,
                    searchTerm: searchController.text,
                  ),
                ),
              );
            },
            child: const Text('Search',
                style: TextStyle(color: Color.fromARGB(235, 230, 142, 19))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  // Implement like functionality
                },
                icon: const Icon(Icons.more_horiz,
                    color: Color.fromARGB(235, 230, 142, 19)),
              ),
              const Text(
                'Likes: 100',
                style: TextStyle(color: Color.fromARGB(235, 230, 142, 19)),
              ),
              const Text('People: 450',
                  style: TextStyle(color: Color.fromARGB(235, 230, 142, 19))),
            ],
          ),
        ],
      ),
    );
  }
}

class SearchScreen extends StatelessWidget {
  final List<bool> selectedItems;
  final String searchTerm;

  SearchScreen(
      {super.key, required this.selectedItems, required this.searchTerm});

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
            child: Text(
              'Search Term: . $searchTerm',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Selected Items: ${selectedItems.toString()}',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
          ),
          // Add additional search screen UI components here
          Expanded(
            child: Container(
              color: Colors.grey.shade300,
            ),
          )
        ],
      ),
    );
  }
}
