import 'package:flutter/material.dart';

class PendingKYC extends StatelessWidget {
  const PendingKYC({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Container(
        width: double.infinity,
        // height: 126,
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                transform: GradientRotation(90),
                // begin: Alignment.topRight,
                // end: Alignment.bottomLeft,
                // stops: [0.2,0.8],
                colors: [
                  Color.fromARGB(255, 26, 72, 255),
                  Color.fromARGB(255, 165, 173, 255)
                ]),
            borderRadius: BorderRadius.circular(16)),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'KYC Pending',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'You need to provide the required\n documents for your account activation.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              'Click Here',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 14,
            ),
          ],
        ),
      ),
    );
  }
}

