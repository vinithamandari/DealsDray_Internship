import 'package:flutter/material.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Image.network(
                "http://devapiv4.dealsdray.com/icons/cat_mobile.png"),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Mobile',
              style: TextStyle(fontSize: 11),
            ),
          ],
        ),
        Column(
          children: [
            Image.network(
                "http://devapiv4.dealsdray.com/icons/cat_lap.png"),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Laptop',
              style: TextStyle(fontSize: 11),
            ),
          ],
        ),
        Column(
          children: [
            Image.network(
                "http://devapiv4.dealsdray.com/icons/cat_camera.png"),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Camera',
              style: TextStyle(fontSize: 11),
            ),
          ],
        ),
        Column(
          children: [
            Image.network(
                "http://devapiv4.dealsdray.com/icons/cat_led.png"),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'LED',
              style: TextStyle(fontSize: 11),
            ),
          ],
        )
      ],
    );
  }
}

