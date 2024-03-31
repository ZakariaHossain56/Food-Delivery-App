import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(8),
      ),
        padding: const EdgeInsets.all(25.0),
        margin: const EdgeInsets.only(left: 25, right: 25, bottom: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //delivery fee
            Column(
              children: [
                Text(
                  "\$0.99",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  ),
                Text(
                  "Delivery fee",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  ),
              ],
            ),
        
            //delivery time
            Column(
              children: [
                Text(
                  "15-30 min",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  ),
                Text(
                  "Delivery time",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  ),
              ],
            ),
          ],
        ),
    );
  }
}