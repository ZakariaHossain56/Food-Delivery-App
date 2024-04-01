import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:intl/intl.dart';

class Restaurent extends ChangeNotifier{
  //list of food menu
  final List<Food> _menu = [

    //burgers
      Food(
      name: "Avocado Burger", 
      description: "A burger featuring creamy avocado slices as a key ingredient.", 
      imagePath: "lib/images/burgers/avocado_burger.png", 
      price: 4.99, 
      category: FoodCategory.burgers, 
      availableAddons: [
        Addon(name: "Bacon", price: 0.99),
        Addon(name: "Pepper Jack Cheese", price: 1.49),
        Addon(name: "Chipotle Aioli", price: 1.99),
      ],
      ),
      Food(
      name: "Big Mac Burger", 
      description: "McDonald's signature burger with two beef patties, special sauce, lettuce, cheese, pickles, and onions on a sesame seed bun.", 
      imagePath: "lib/images/burgers/big_mac_burger.png", 
      price: 3.99, 
      category: FoodCategory.burgers, 
      availableAddons: [
        Addon(name: "Crispy Bacon", price: 0.99),
        Addon(name: "Extra Cheese", price: 1.49),
        Addon(name: "Jalapenos", price: 1.99),
      ],
      ),
      Food(
      name: "Black Bean Burger", 
      description: "A vegetarian burger made primarily from black beans, often seasoned with various spices and herbs.", 
      imagePath: "lib/images/burgers/black_bean_burger.png", 
      price: 4.49, 
      category: FoodCategory.burgers, 
      availableAddons: [
        Addon(name: "Guacamole", price: 0.99),
        Addon(name: "Grilled Onions", price: 1.49),
        Addon(name: "Melted Cheddar Cheese", price: 1.99),
      ],
      ),
      Food(
      name: "Burger King Whopper", 
      description: "Burger King's iconic flame-grilled beef burger with lettuce, tomato, onion, pickles, ketchup, and mayonnaise on a sesame seed bun.", 
      imagePath: "lib/images/burgers/burger_king_whooper.png", 
      price: 3.49, 
      category: FoodCategory.burgers, 
      availableAddons: [
        Addon(name: "Crispy Onion Rings", price: 0.99),
        Addon(name: "Barbecue Sauce", price: 1.49),
        Addon(name: "Jalapeno Slices", price: 1.99),
      ],
      ),
      Food(
      name: "Chicken Burger", 
      description: "A burger made with a breaded or grilled chicken patty, often accompanied by lettuce, tomato, and mayo or other sauces.", 
      imagePath: "lib/images/burgers/chicken_burger.png", 
      price: 5.49, 
      category: FoodCategory.burgers, 
      availableAddons: [
        Addon(name: "Crispy Bacon", price: 0.99),
        Addon(name: "Swiss Cheese", price: 1.49),
        Addon(name: "Honey Mustard Dressing", price: 1.99),
      ],
      ),


      //desserts
      Food(
      name: "Cake", 
      description: "A sweet baked dessert.", 
      imagePath: "lib/images/desserts/cake.png", 
      price: 1.49, 
      category: FoodCategory.desserts, 
      availableAddons: [
        Addon(name: "Whipped Cream", price: 0.99),
        Addon(name: "Fresh Fruit", price: 1.49),
        Addon(name: "Chocolate Drizzle", price: 1.99),
      ],
      ),
      Food(
      name: "Custard", 
      description: "A creamy dessert made from milk, eggs, and sugar.", 
      imagePath: "lib/images/desserts/custard.png", 
      price: 2.49, 
      category: FoodCategory.desserts, 
      availableAddons: [
        Addon(name: "Caramel Sauce", price: 0.99),
        Addon(name: "Toasted Almonds", price: 1.49),
        Addon(name: "Seasonal Berries", price: 1.99),
      ],
      ),
      Food(
      name: "Gelatin", 
      description: "A jiggly dessert made from flavored gelatin mix.", 
      imagePath: "lib/images/desserts/gelatin.png", 
      price: 0.49, 
      category: FoodCategory.desserts, 
      availableAddons: [
        Addon(name: "Whipped Cream", price: 0.99),
        Addon(name: "Fruit Cocktail", price: 1.49),
        Addon(name: "Sprinkles", price: 1.99),
      ],
      ),
      Food(
      name: "Ice Cream", 
      description: " A frozen treat available in various flavors.", 
      imagePath: "lib/images/desserts/ice_cream.png", 
      price: 1.49, 
      category: FoodCategory.desserts, 
      availableAddons: [
        Addon(name: "Hot Fudge Sauce", price: 0.99),
        Addon(name: "Crushed Cookies", price: 1.49),
        Addon(name: "Rainbow Sprinkles", price: 1.99),
      ],
      ),
      Food(
      name: "Pudding", 
      description: "A smooth and creamy dessert.", 
      imagePath: "lib/images/desserts/pudding.png", 
      price: 1.49, 
      category: FoodCategory.desserts, 
      availableAddons: [
        Addon(name: "Whipped Cream", price: 0.99),
        Addon(name: "Caramelized Bananas", price: 1.49),
        Addon(name: "Chocolate Shavings", price: 1.99),
      ],
      ),


      //drinks
      Food(
      name: "Clausthaler Beer", 
      description: "A non-alcoholic beer with a crisp taste.", 
      imagePath: "lib/images/drinks/clausthaler_beer.png", 
      price: 1.99, 
      category: FoodCategory.drinks, 
      availableAddons: [
        Addon(name: "Lime Wedges", price: 0.99),
        Addon(name: "Pretzels", price: 1.49),
        Addon(name: "Barbecue Chicken Wings", price: 1.99),
      ],
      ),
      Food(
      name: "Coca-Cola", 
      description: "A classic carbonated beverage.", 
      imagePath: "lib/images/drinks/coca_cola.png", 
      price: 1.49, 
      category: FoodCategory.drinks, 
      availableAddons: [
        Addon(name: "Lime Wedges", price: 0.99),
        Addon(name: "Pretzels", price: 1.49),
        Addon(name: "Vanilla Ice Cream", price: 1.99),
      ],
      ),
      Food(
      name: "Espresso", 
      description: "A strong and rich coffee shot.", 
      imagePath: "lib/images/drinks/espresso.png", 
      price: 2.99, 
      category: FoodCategory.drinks, 
      availableAddons: [
        Addon(name: "Lemon Peel", price: 0.99),
        Addon(name: "Dark Chocolate", price: 1.49),
        Addon(name: "Frothed Milk", price: 1.99),
      ],
      ),
      Food(
      name: "Red Bull", 
      description: "An energy drink renowned for its revitalizing effects.", 
      imagePath: "lib/images/drinks/red_bull.png", 
      price: 1.99, 
      category: FoodCategory.drinks, 
      availableAddons: [
        Addon(name: "Slice of Lime", price: 0.99),
        Addon(name: "Cranberry Juice", price: 1.49),
        Addon(name: "Cocktails", price: 1.99),
      ],
      ),
      Food(
      name: "Sprite", 
      description: "A refreshing lemon-lime soda.", 
      imagePath: "lib/images/drinks/sprite.png", 
      price: 0.99, 
      category: FoodCategory.drinks, 
      availableAddons: [
        Addon(name: "Sherbet", price: 0.99),
        Addon(name: "Fresh Mint Leaves", price: 1.49),
        Addon(name: "Grenadine", price: 1.99),
      ],
      ),


      //salads
      Food(
      name: "Chicken Salad", 
      description: "A fresh salad featuring grilled chicken strips atop a bed of mixed greens.", 
      imagePath: "lib/images/salads/chicken_salad.png", 
      price: 0.99, 
      category: FoodCategory.salads, 
      availableAddons: [
        Addon(name: "Avocado Slices", price: 0.99),
        Addon(name: "Roasted Nuts", price: 1.49),
        Addon(name: "Balsamic Glaze Drizzle", price: 1.99),
      ],
      ),
      Food(
      name: "Cobb Salad", 
      description: "A hearty salad comprising chopped lettuce, diced tomatoes, hard-boiled eggs, bacon crumbles, and blue cheese crumbles.", 
      imagePath: "lib/images/salads/cobb_salad.png", 
      price: 1.99, 
      category: FoodCategory.salads, 
      availableAddons: [
        Addon(name: "Sliced Grilled Steak", price: 0.99),
        Addon(name: "Diced Avocado", price: 1.49),
        Addon(name: "Creamy Ranch Dressing", price: 1.99),
      ],
      ),
      Food(
      name: "Greek Salad", 
      description: "A vibrant salad composed of crisp lettuce, juicy tomatoes, cucumbers, red onions, Kalamata olives, and feta cheese.", 
      imagePath: "lib/images/salads/greek_salad.png", 
      price: 2.99, 
      category: FoodCategory.salads, 
      availableAddons: [
        Addon(name: "Marinated Artichoke Hearts", price: 0.99),
        Addon(name: "Pepperoncini Peppers", price: 1.49),
        Addon(name: "Tangy Greek Dressing", price: 1.99),
      ],
      ),
      Food(
      name: "Leafy Green Salad", 
      description: "A light and refreshing salad featuring assorted leafy greens.", 
      imagePath: "lib/images/salads/leafy_green_salad.png", 
      price: 1.99, 
      category: FoodCategory.salads, 
      availableAddons: [
        Addon(name: "Citrus Vinaigrette", price: 0.99),
        Addon(name: "Honey Mustard Dressing", price: 1.49),
        Addon(name: "Creamy Avocado Dressing", price: 1.99),
      ],
      ),
      Food(
      name: "Niçoise Salad", 
      description: "A French-inspired salad showcasing tuna, boiled potatoes, green beans, hard-boiled eggs, and olives.", 
      imagePath: "lib/images/salads/niçoise_salad.png", 
      price: 1.49, 
      category: FoodCategory.salads, 
      availableAddons: [
        Addon(name: "Anchovy Fillets", price: 0.99),
        Addon(name: "Capers", price: 1.49),
        Addon(name: "Dijon Vinaigrette Dressing", price: 1.99),
      ],
      ),


      //sides
      Food(
      name: "Chive Smashed Potatoes", 
      description: "Creamy potatoes mashed with chives for a flavorful side dish.", 
      imagePath: "lib/images/sides/chive_smashed_potatoes.png", 
      price: 1.49, 
      category: FoodCategory.sides, 
      availableAddons: [
        Addon(name: "Melted Butter", price: 0.99),
        Addon(name: "Crispy Bacon Bits", price: 1.49),
        Addon(name: "Shredded Cheddar Cheese", price: 1.99),
      ],
      ),
      Food(
      name: "Coleslaw", 
      description: "A crunchy salad made with shredded cabbage and carrots, dressed with a tangy mayo-based dressing.", 
      imagePath: "lib/images/sides/coleslaw.png", 
      price: 2.49, 
      category: FoodCategory.sides, 
      availableAddons: [
        Addon(name: "Diced Apples", price: 0.99),
        Addon(name: "Raisins", price: 1.49),
        Addon(name: "Chopped Pecans", price: 1.99),
      ],
      ),
      Food(
      name: "Garlic Knots", 
      description: "Soft and doughy bread knots brushed with garlic-infused butter.", 
      imagePath: "lib/images/sides/garlic_knots.png", 
      price: 1.49, 
      category: FoodCategory.sides, 
      availableAddons: [
        Addon(name: "Marinara Sauce", price: 0.99),
        Addon(name: "Grated Parmesan Cheese", price: 1.49),
        Addon(name: "Fresh Parsley", price: 1.99),
      ],
      ),
      Food(
      name: "Macaroni Salad", 
      description: "A classic pasta salad featuring elbow macaroni tossed in a creamy dressing.", 
      imagePath: "lib/images/sides/macaroni_salad.png", 
      price: 2.49, 
      category: FoodCategory.sides, 
      availableAddons: [
        Addon(name: "Diced Celery", price: 0.99),
        Addon(name: "Red Bell Peppers", price: 1.49),
        Addon(name: "Hard-boiled Eggs", price: 1.99),
      ],
      ),
      Food(
      name: "Parmesan Herbed Noodles", 
      description: "Tender pasta infused with aromatic herbs and Parmesan cheese, creating a flavorful and comforting dish..", 
      imagePath: "lib/images/sides/parmesan_herbed_noodles.png", 
      price: 2.99, 
      category: FoodCategory.sides, 
      availableAddons: [
        Addon(name: "Sautéed Garlic Shrimp", price: 0.99),
        Addon(name: "Roasted Cherry Tomatoes", price: 1.49),
        Addon(name: "Grilled Asparagus Spears", price: 1.99),
      ],
      ),
  ];


  //user cart
  final List<CartItem> _cart = [];

  //delivery address
  String _deliveryAddress = '99 Holywood Blv';




  //GETTERS
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;


  //OPERATIONS


  //add to cart
  void addToCart(Food food, List<Addon> selectedAddons){
    //see if there is a cart item aleady with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the food items are the same
      bool isSameFood = item.food == food;

      //check if the list of selected addons are the same
      bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);

      return isSameFood && isSameAddons;
    });

    // if item already exists, increase its quantity
    if(cartItem != null){
      cartItem.quantity++;
    }

    //otherwise, add a new cart item to the cart
    else{
      _cart.add(
        CartItem(food: food, selectedAddons: selectedAddons,),
      );
    }
    notifyListeners();      //notify the listeners to update the UI
  }

  //remove from cart
  void removeFromCart(CartItem cartItem){
    int cartIndex = _cart.indexOf(cartItem);

    if(cartIndex != -1){
      if(_cart[cartIndex].quantity > 1){
        _cart[cartIndex].quantity--;
      }
      else{
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();      //notify listeners to update the UI
  }

  //get total price of cart
  double getTotalPrice(){
    double total = 0.0;
    for(CartItem cartItem in _cart){
      double itemTotal = cartItem.food.price;

      for(Addon addon in cartItem.selectedAddons){
        itemTotal += addon.price;
      }

      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //get total no of items in cart
  int getTotalItemCount(){
    int totalItemCount = 0;

    for(CartItem cartItem in _cart){
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //clear cart
  void clearCart(){
    _cart.clear();
    notifyListeners();    //notify listeners to update the UI
  }


  //update the delivery address
  void updateDeliveryAddress(String newAddress){
    _deliveryAddress = newAddress;
    print("delivery address");
    print(_deliveryAddress);
    notifyListeners();
  }

  //HELPERS

  //generate a receipt
  String displayCartReceipt(){
    final receipt = StringBuffer();    //long string
    receipt.writeln("Here is your receipt.");
    receipt.writeln();

    //format the date to include upto seconds only  
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("----------");

    for(final cartItem in _cart){
      receipt.writeln("${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");

      if(cartItem.selectedAddons.isNotEmpty){
        receipt.writeln("    Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("----------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");

    return receipt.toString();
  }
  

  //format double value into money
  String _formatPrice(double price){
    return "\$${price.toStringAsFixed(2)}";
  }

  //format list of addons into a string summary
  String _formatAddons(List<Addon> addons){
    return addons.map((addon) => "${addon.name} (${_formatPrice(addon.price)})").join(", ");
  }
}