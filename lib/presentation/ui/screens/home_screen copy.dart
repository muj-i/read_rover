import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:read_rover/data/model/get_book_file_model.dart';
import 'package:read_rover/data/utils/auth_utils.dart';
import 'package:read_rover/presentation/ui/utils/constraints.dart';
import 'package:read_rover/presentation/ui/widgets/profile_app_bar.dart';
//import 'package:read_rover/ui/widgets/profile_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> books = [];
  final GetBookFile _getBookFile = GetBookFile();
  @override
  void initState() {
    super.initState();
    fetchBooks();
    //getNewBook();
  }

  Future<void> fetchBooks() async {
    final userData = await AuthUtils.getUserInfo();
    final String token = userData.accessToken.toString();
    //'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjMxLCJpc19hZG1pbiI6ZmFsc2UsImV4cCI6MTY5NDQ2OTgwOX0.MYfKh28YxoPEegcsjjFUwPOJdRVyL-cpkHe5Ewo_j44'; // Replace with your authentication token

    final response = await http.get(
      Uri.parse('http://20.239.87.34:8080/books'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      setState(() {
        books = json.decode(response.body)['rows'];
      });
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Failed')));
      }
    }
  }

  // Future<void> getNewBook() async {
  //   final userData = await AuthUtils.getUserInfo();
  //   final String token = userData.accessToken.toString();

  //   final NetworkResponse response =
  //       await NetworkCaller().getRequest(Urls.getBookFile);

  //   if (mounted) {
  //     setState(() {});
  //   }
  //   if (response.isSuccess) {
  //     //final List<dynamic> responseList = jsonDecode(response.body);

  //     setState(() {
  //      // books = responseList;
  //     });
  //     // _getBookFile = GetBookFile.fromJson(response.body!);
  //     // books = _getBookFile.rows ?? [];
  //   } else {
  //     if (mounted) {
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(const SnackBar(content: Text('Failed')));
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myAppBarColor,
      appBar: const ProfileAppBar(),
      body: GridView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
      
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              color: Colors.green,
              child: ListTile(
                title: Text(book['name']),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(book['author_name']),
                    Text(book['publisher_name']),
                  ],
                ),
                // leading: CachedNetworkImage(
                //   imageUrl: 'http://20.239.87.34:8080${book['image']}',
                //   placeholder: (context, url) => const CircularProgressIndicator(),
                //   errorWidget: (context, url, error) => const Icon(Icons.error),
                // ),
                onTap: () {},
              ),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
      ),
    );
  }
}
