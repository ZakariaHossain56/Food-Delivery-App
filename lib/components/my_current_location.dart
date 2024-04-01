import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurent.dart';
import 'package:provider/provider.dart';

class MyCurrentLocation extends StatelessWidget {
   MyCurrentLocation({super.key});


  final textController = TextEditingController();

  void openLocationSearchBox(BuildContext context){
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text("Your location"),
        content: TextField(
          controller: textController,
          decoration: InputDecoration(
            hintText: "Enter address.."
          ),
        ),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () { 
              Navigator.pop(context);
              textController.clear();
            },
            child: Text("Cancel"),
            ),

            //save button
            MaterialButton(
            onPressed: (){ 
              //update delivery address
              String newAddress = textController.text;
              // print("New address: $newAddress");
              // print("Text controller value: ${textController.value.text}");
              context.read<Restaurent>().updateDeliveryAddress(newAddress);
              Navigator.pop(context);
              textController.clear();
            },
            child: Text("Save"),
            ),
        ],
      ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deliver now",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary
            ),
          ),
      
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
              children: [
                
                Consumer<Restaurent>(
                  builder: (context, restaurent, child) => Text(
                    restaurent.deliveryAddress,
                    style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ),
                  
                //dropdown menu
                Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}