import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:read_rover/data/utils/auth_utils.dart';
import 'package:read_rover/ui/auth/login_page.dart';
//import 'package:read_rover/ui/widgets/profile_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> books = []; 

  @override
  void initState() {
    super.initState();
    fetchBooks();
    _loadUserInfo();
  }

  String userName = 'Loading...';
  String userEmail = '';

  Future<void> _loadUserInfo() async {
    final userData = await AuthUtils.getUserInfo();
    setState(() {
      userName = userData.user?.name ?? 'No name found';
      userEmail = userData.user?.email ?? 'No email found';
    });
  }
  // Future<void> fetchBooks() async {

  //   final response =
  //       await http.get(Uri.parse('http://20.239.87.34:8080/books'));

  //   if (response.statusCode == 200) {
  //     setState(() {
  //       books = json.decode(response.body)['rows'];
  //     });
  //   } else {
  //     if (mounted) {
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(const SnackBar(content: Text('Failed')));
  //     }
  //   }
  // }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                fetchBooks();
              },
              icon: Icon(Icons.refresh)),
          IconButton(
              onPressed: () {
                 AuthUtils.clearUserInfo();

         if(mounted)   {  Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false);}
              },
              icon: Icon(Icons.logout))
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 8,
            ),
            Text(
              userName,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            Text(
              userEmail,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];

          return ListTile(
            title: Text(book['name']),
            subtitle: Text(book['author_name']),
            leading: CachedNetworkImage(
              imageUrl: 'http://20.239.87.34:8080${book['image']}',
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            onTap: () {},
          );
        },
      ),
    );
  }
}
