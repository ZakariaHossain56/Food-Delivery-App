import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:food_delivery_app/models/restaurent.dart';
import 'package:provider/provider.dart';

class FoodPage extends StatefulWidget {

  final Food food;
  Map<Addon,bool> selectedAddons = {};

   FoodPage({
    super.key,
    required this.food,
    }){
      // Initialize selected addons with unique keys to be false
    selectedAddons = Map.fromIterable(
    food.availableAddons,
    key: (addon) => addon, // Use addon itself as the key
    value: (_) => false,   // Initialize all values to false
  );
    }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {

  //method to add to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons){

    //close the current food page to go back to menu
    Navigator.pop(context);

    //format the selected addons
    List<Addon> currentlySelectedAddons = [];
    for(Addon addon in widget.food.availableAddons){
      if (widget.selectedAddons[addon] = true){
        currentlySelectedAddons.add(addon);
      }
    }

    //add to cart
    context.read<Restaurent>().addToCart(food, currentlySelectedAddons);
  }



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //scaffold UI
        Scaffold(
      body: SingleChildScrollView(
        child: Column(
         
          children: [
            //food image
            Image.asset(widget.food.imagePath),
        
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //food name
              Text(
                widget.food.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                ),
        
                
        
                //food price
                Text(
                '\$${widget.food.price}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16,
                ),
                ),
        
                const SizedBox(height: 10),
              
              //food description
              Text(
                widget.food.description,
                ),
        
                const SizedBox(height: 10),
        
                Divider(color: Theme.of(context).colorScheme.secondary),
        
                const SizedBox(height: 10),
              
              //addons
              Text(
                  "Add-ons",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        
                const SizedBox(height: 10),
        
        
        
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.food.availableAddons.length,
                  itemBuilder: (context, index){
                    //get individual addon
                    Addon addon = widget.food.availableAddons[index];
                
                    //return checkbox UI
                    return CheckboxListTile(
                      title: Text(addon.name),
                      subtitle: Text(
                        '\$${addon.price}',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        ),
                      value: widget.selectedAddons[addon], 
                      onChanged: (bool? value) {
                        setState(() {
                          widget.selectedAddons[addon] = value!;
                        });
                      },
                      );
                  },
                  ),
              )
                ],
              ),
            ),
        
            // button -> add to cart
            MyButton(
              ontap: () => addToCart(widget.food, widget.selectedAddons), 
              text: "Add to cart",
              ),
            const SizedBox(height: 25),
          ],
            ),
      ),
    ),

        //back button
        SafeArea(
          child: Opacity(
            opacity: 0.6,
            child: Container(
              margin: EdgeInsets.only(left: 25),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_rounded),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ),
      ],
    );
  }
}