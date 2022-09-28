import 'package:flutter/material.dart';

class Section extends StatefulWidget {
  final String title;
  late bool isSelected;

  Section({
    Key? key,
    required this.title,
    required this.isSelected
  }) : super(key: key);

  @override
  State<Section> createState() => _SectionState();
}

class _SectionState extends State<Section> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Text(
          widget.title,
          style: TextStyle(
              fontSize: widget.isSelected ? 20 : 18,
              fontWeight: FontWeight.bold,
              color: widget.isSelected ? Colors.amber : Colors.black
          ),
        ),
      ),
      onTap: () {
        setState(() {
          widget.isSelected = !widget.isSelected;
        });
      },
    );
  }
}
