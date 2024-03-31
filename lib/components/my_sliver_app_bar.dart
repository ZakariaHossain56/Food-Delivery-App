import 'package:flutter/material.dart';

class MySliverAppBar extends StatelessWidget {

  final Widget child;
  final Widget title;


  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title,
    });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,    //max height
      collapsedHeight: 120,   //height when scrolled up
      floating: false,
      pinned: true,           //the appbar is pinned
      actions: [
        //cart button
        IconButton(
          onPressed: () {}, 
          icon: Icon(Icons.shopping_cart),
          ),
      ],
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text("Sunset Diner"),
      centerTitle: true,
      flexibleSpace: FlexibleSpaceBar(
        background: child,
        title: title,
        centerTitle: true,
        titlePadding: EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}