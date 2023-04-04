import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';
import '../models/user.dart';

class SwipeCard extends StatefulWidget {
  const SwipeCard({super.key});

  @override
  State<SwipeCard> createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard> {
  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  final List<User> _user = [
    User(
        id: 1,
        name: 'Rex',
        age: 27,
        address: 'Usa',
        imageUrl: 'assets/Rex.png'),
    User(
        id: 2,
        name: 'John',
        age: 32,
        address: 'England',
        imageUrl: 'assets/John.png'),
  ];

  @override
  void initState() {
    super.initState();
    _swipeItems.add(
      SwipeItem(
        content: _user[0],
        likeAction: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Liked ${_user[0].name}"),
              duration: const Duration(milliseconds: 500),
            ),
          );
        },
        nopeAction: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Nope ${_user[0].name}"),
              duration: const Duration(milliseconds: 500),
            ),
          );
        },
      ),
    );
    _swipeItems.add(
      SwipeItem(
        content: _user[1],
        likeAction: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Liked ${_user[1].name}"),
              duration: const Duration(milliseconds: 500),
            ),
          );
        },
        nopeAction: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Nope ${_user[1].name}"),
              duration: const Duration(milliseconds: 500),
            ),
          );
        },
      ),
    );
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  @override
  Widget build(BuildContext context) {
    return SwipeCards(
      matchEngine: _matchEngine!,
      itemBuilder: (context, index) {
        User user = _swipeItems[index].content as User;
        return Stack(
          children: [
            Image(
              image: AssetImage(user.imageUrl),
              fit: BoxFit.cover,
            ),
          ],
        );
      },
      onStackFinished: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Stack Finished"),
            duration: Duration(milliseconds: 500),
          ),
        );
      },
      leftSwipeAllowed: true,
      rightSwipeAllowed: true,
      upSwipeAllowed: false,
      fillSpace: true,
    );
  }
}
