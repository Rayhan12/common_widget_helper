import 'package:flutter/material.dart';

class IconImageBox extends StatefulWidget {
  final String assetName;
  final Color backgroundColor;
  const IconImageBox({Key? key, required this.assetName, required this.backgroundColor}) : super(key: key);

  @override
  State<IconImageBox> createState() => _IconImageBoxState();
}

class _IconImageBoxState extends State<IconImageBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(15),
      child: Image.asset(widget.assetName ,height: 25 ,width: 25),
    );
  }
}