import 'package:datingapp_ui/widgets/swipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:swipe_cards/swipe_cards.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'DateHive',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: null,
                  icon: Image(
                    image: AssetImage('assets/filter_icon.png'),
                    height: 25,
                    width: 25,
                  ),
                ),
              ],
            ),
          ),
          const Expanded(child: SwipeCard())
        ],
      ),
    );
  }
}
