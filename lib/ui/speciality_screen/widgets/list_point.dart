import 'package:flutter/material.dart';

class ListPoint {

  static List<Widget> buildProfessionalFields(List<String> fields) {
    return fields
        .map((field) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const Icon(
            Icons.circle,
            color: Colors.black,
            size: 10,
          ),
          const SizedBox(width: 8),
          Expanded(child: Text(field)),
        ],
      ),
    ))
        .toList();
  }
}