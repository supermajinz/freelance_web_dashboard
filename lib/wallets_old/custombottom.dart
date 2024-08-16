import 'package:dash/screen/transfer.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      key: const Key('customBottomAppBar'), // Key for testing.
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.pink),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TransferScreen()));
            },
            key: const Key('homeButton'), // Key for testing.
          ),
        ],
      ),
    );
  }
}
