import 'package:flutter/material.dart';

class IconCounter extends StatelessWidget {
  final Widget icon;
  final int counter;

  const IconCounter({
    Key? key,
    required this.icon,
    required this.counter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return counter > 0 ? InkWell(
      child: Container(
        width: 72,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (counter > 0)
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [icon,],
            ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                      alignment: Alignment.center,
                  child: Text(
                    '$counter',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
          ],
        ),
      ),
    ) : const Text('');
  }
}
