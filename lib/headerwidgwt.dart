import 'package:dash/const/const.dart';
import 'package:flutter/material.dart';

class HeaderWidgwt extends StatelessWidget {
  const HeaderWidgwt({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: cardBackgroundColor,
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
            ),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(color: Theme.of(context).primaryColor)),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 5,
            ),
            hintText: 'Search',
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
              size: 21,
            )),
      ),
    );
  }
}
