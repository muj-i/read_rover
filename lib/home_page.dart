import 'package:flutter/material.dart';
import 'package:read_rover/widgets/profile_app_bar.dart';
import 'package:read_rover/widgets/task_list_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: ProfileAppBar(),
      body: SingleChildScrollView(
        scrollDirection:
            Axis.vertical, // Enable vertical scrolling for the entire column
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Enable horizontal scrolling
              child: Row(
                children: List.generate(
                  10, // Adjust the number of items as needed
                  (index) {
                    return Container(
                      height: 200,
                      width: 200, // Adjust the width of your grid items
                      margin: const EdgeInsets.all(10.0),
                      child: Card(
                        child: Center(
                          child: Text(
                            'Item $index',
                            style: const TextStyle(fontSize: 24.0),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ), const SizedBox(
              height: 10,
            ),
            Container(
              height: 300,
              child: ListView.builder(
                shrinkWrap: true, // Allow the ListView to take the necessary vertical space
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    child: TaskListTile(
                      chipBackgroundColor: Colors.cyan,
                      onDeletePress: () {},
                      onEditPress: () {},
                      onStatusChipPress: () {},
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Enable horizontal scrolling
              child: Row(
                children: List.generate(
                  10, // Adjust the number of items as needed
                  (index) {
                    return Container(
                      height: 200,
                      width: 200, // Adjust the width of your grid items
                      margin: const EdgeInsets.all(10.0),
                      child: Card(
                        child: Center(
                          child: Text(
                            'Item $index',
                            style: const TextStyle(fontSize: 24.0),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
