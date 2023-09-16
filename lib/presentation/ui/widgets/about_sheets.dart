import 'package:flutter/material.dart';
import 'package:read_rover/presentation/ui/utils/constraints.dart';

class AboutSheet extends StatelessWidget {
  const AboutSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(100), topRight: Radius.circular(25)),
      child: SizedBox(
        height: 600,
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'About ReadRover',
                      style: myTextStyle.copyWith(fontSize: 20),
                    ),
                  ),
                  const Text('data'),
                  const Text('data'),
                  const Text('data'),
                  const Text('data'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
