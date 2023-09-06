import 'package:flutter/material.dart';
import 'package:read_rover/data/model/get_book_file_model.dart';
import 'package:read_rover/ui/widgets/constraints.dart';

class BookListTile extends StatelessWidget {
  final VoidCallback onDeletePress, onEditPress, onStatusChipPress;
  final Color chipBackgroundColor;
  final GetBookFile data;

  const BookListTile(
      {super.key,
      required this.chipBackgroundColor,
      required this.onDeletePress,
      required this.onEditPress,
      required this.onStatusChipPress,
      required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(data.pageNo.toString() ?? 'No ittle found'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('No description found'),
            const SizedBox(
              height: 8,
            ),
            Text('Created Date:?? '),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: onStatusChipPress,
                  child: Chip(
                    label: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      child: Text(
                        'New',
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                    backgroundColor: chipBackgroundColor,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: onEditPress,
                  icon: Icon(
                    Icons.one_x_mobiledata,
                    color: myColor,
                  ),
                ),
                IconButton(
                  onPressed: onDeletePress,
                  icon: Icon(
                    Icons.baby_changing_station,
                    color: myColor,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
