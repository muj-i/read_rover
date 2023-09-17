import 'package:flutter/material.dart';
import 'package:read_rover/presentation/ui/utils/color_palette.dart';

class BookListCard extends StatelessWidget {
  final String bookName;
  final String bookAuthorName;
  final String imageUrl;
  const BookListCard({
    super.key,
    required this.bookName,
    required this.bookAuthorName,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: customColor.withOpacity(.2),
      shadowColor: customColor.withOpacity(0.1),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: FittedBox(
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 140,
              width: 160,
              decoration: BoxDecoration(
                color: customColor.withOpacity(.2),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    bookName,
                    maxLines: 1,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    bookAuthorName,
                    maxLines: 1,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
