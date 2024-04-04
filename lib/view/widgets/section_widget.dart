import 'package:flutter/material.dart';

class SectionWidget extends StatelessWidget {
  final String image;
  final String name;
  final VoidCallback? onPressed;
  const SectionWidget(
      {this.onPressed, super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: const [
              BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 3)
            ]),
        child: Column(
          children: [
            Image.asset(
              image,
              height: 24,
            ),
            Text(
              name,
            )
          ],
        ),
      ),
    );
  }
}
