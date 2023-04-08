import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_cards/swipe_cards.dart';
import '../models/user.dart';

class SwipeCard extends StatefulWidget {
  const SwipeCard({super.key});

  @override
  State<SwipeCard> createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard> {
  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  String? _name;
  String? _address;
  MatchEngine? _matchEngine;
  final List<User> _user = [
    User(
      id: 2,
      name: 'Ian',
      age: 28,
      address: 'Australia',
      imageUrl: 'assets/ian.jpg',
    ),
    User(
      id: 2,
      name: 'Joseph',
      age: 35,
      address: 'German',
      imageUrl: 'assets/joseph.jpg',
    ),
    User(
      id: 2,
      name: 'Matheus',
      age: 25,
      address: 'Israel',
      imageUrl: 'assets/matheus.jpg',
    ),
    User(
      id: 2,
      name: 'Michael',
      age: 35,
      address: 'USA',
      imageUrl: 'assets/michael.jpg',
    ),
    User(
      id: 2,
      name: 'Rafaella',
      age: 28,
      address: 'Italy',
      imageUrl: 'assets/rafaella.jpg',
    ),
  ];

  @override
  void initState() {
    super.initState();
    for (var u in _user) {
      _swipeItems.add(
        SwipeItem(
          content: u,
        ),
      );
    }
    _name = _user[0].name;
    _address = _user[0].address;
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SwipeCards(
            matchEngine: _matchEngine!,
            itemBuilder: (context, index) {
              User user = _swipeItems[index].content as User;
              return Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(35)),
                        child: LayoutBuilder(builder: (context, constrints) {
                          return Image(
                            image: AssetImage(user.imageUrl),
                            fit: BoxFit.cover,
                            width: constrints.maxWidth,
                            height: constrints.maxHeight,
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              );
            },
            itemChanged: (p0, p1) {
              User u = p0.content as User;
              setState(() {
                _name = u.name;
                _address = u.address;
              });
            },
            onStackFinished: () {
              setState(() {
                _name = '';
                _address = '';
              });
            },
            leftSwipeAllowed: true,
            rightSwipeAllowed: true,
            upSwipeAllowed: false,
            fillSpace: true,
          ),
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            _name!,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                letterSpacing: -0.3,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            _address!,
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                letterSpacing: -0.3,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
