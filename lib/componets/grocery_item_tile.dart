import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final Color color;
  void Function()? onPressed;
  GroceryItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // image
            Image.asset(
              imagePath,
              height: 80,
            ),
            // name

            Text(
              itemName,
              style: GoogleFonts.notoSerif(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // price + button
            MaterialButton(
              onPressed: onPressed,
              color: color.withOpacity(0.8),
              child: Text(
                '\$ $itemPrice',
                style: GoogleFonts.notoSerif(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
