import 'package:dash/customcard.dart';
import 'package:flutter/material.dart';

class details extends StatelessWidget {
  const details({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            builddetails('Age ', '22'),
            builddetails('Country ', 'Syria')
          ],
        ),
        color: Color(0xFF2F353E));
  }

  Widget builddetails(String key, String value) {
    return Column(
      children: [
        Text(
          key,
          style: const TextStyle(fontSize: 11, color: Colors.grey),
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          value,
          style: TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
