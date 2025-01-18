import 'package:flutter/material.dart';

class DetailTitle extends StatelessWidget {
  final int id;
  final String type;

  const DetailTitle({super.key, required this.id, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: const EdgeInsets.only(top: 50), alignment: Alignment.center,
      child: Text(type,  style: TextStyle(
          fontSize: 28, color: Colors.deepOrange, fontWeight: FontWeight.bold
      )),
    );
  }
}