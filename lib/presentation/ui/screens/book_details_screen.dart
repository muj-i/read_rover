import 'package:flutter/material.dart';
import 'package:read_rover/presentation/ui/utils/assets_images.dart';
import 'package:read_rover/presentation/ui/utils/constraints.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Center(
              child: Image.asset(
                AppImageAssets.people,
                //width: 125,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              'Book Name',
              style: elevatedButtonTextStyle.copyWith(color: Colors.black),
            ),
            Text(
              'Book Category Name',
              style: elevatedButtonTextStyle.copyWith(color: Colors.black),
            ),
            Text(
              'Book Author Name',
              style: elevatedButtonTextStyle.copyWith(color: Colors.black),
            ),
            Text(
              'Book Publissher Name',
              style: elevatedButtonTextStyle.copyWith(color: Colors.black),
            ),
            Text(
              'publish_year',
              style: elevatedButtonTextStyle.copyWith(color: Colors.black),
            ),
            Text(
              'no_of_pages',
              style: elevatedButtonTextStyle.copyWith(color: Colors.black),
            ),
            const Spacer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Read this Book',
                    style: elevatedButtonTextStyle,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            )
          ],
        ));
  }
}
