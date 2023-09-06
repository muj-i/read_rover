import 'package:flutter/material.dart';
import 'package:read_rover/data/model/get_book_file_model.dart';
import 'package:read_rover/data/model/network_response.dart';
import 'package:read_rover/data/services/network_caller.dart';
import 'package:read_rover/data/utils/urls.dart';
import 'package:read_rover/ui/widgets/book_list_tile.dart';
import 'package:read_rover/ui/widgets/constraints.dart';
import 'package:read_rover/ui/widgets/profile_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _getBookFileInProgress = false;

  GetBookFile _getBookFile = GetBookFile();

  Future<void> getNewTask() async {
    _getBookFileInProgress = true;

    if (mounted) {
      setState(() {});
    }
    final NetworkResponse response =
        await NetworkCaller().getRequest(Urls.getBookFile);
    _getBookFileInProgress = false;
    if (mounted) {
      setState(() {});
    }
    if (response.isSuccess) {
      _getBookFile = GetBookFile.fromJson(response.body!);
    } else {
      if (mounted) {
        CustomSnackbar.show(
            context: context, message: 'Tasks cannot be loaded');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: const ProfileAppBar(),
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
            ),
            const SizedBox(
              height: 10,
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
            SizedBox(
              height: 300,
              child: ListView.builder(
                shrinkWrap:
                    true, // Allow the ListView to take the necessary vertical space
                itemBuilder: (context, index) {
                  final reversedIndex = _getBookFile.rows!.length - 1 - index;
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                    child: BookListTile(
                      chipBackgroundColor: Colors.cyan,
                      onDeletePress: () {},
                      onEditPress: () {},
                      onStatusChipPress: () {},
                      data: null,
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
