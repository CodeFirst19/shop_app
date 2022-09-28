import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String conditionLabel;
  final Color? color;

  const CustomButton({
    Key? key,
    required this.icon,
    required this.conditionLabel,
    required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              border: Border.all(width: 1)),
          child: Center(
              child: conditionLabel == 'icon'
              ? Icon(icon)
              : Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(10)
                  ),
              ),
          )
      ),
    );
  }
}
