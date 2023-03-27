import 'package:flutter/material.dart';

class BoltsCard extends StatelessWidget {
  final String title;
  final String image;
  final bool completed;

  const BoltsCard({
    Key? key,
    required this.title,
    required this.completed,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(image),
        title: Text(title),
        minLeadingWidth: 20,
        subtitle: Text(completed.toString()),
      ),
    );
  }
}
