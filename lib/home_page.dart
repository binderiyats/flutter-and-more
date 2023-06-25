import 'dart:async';

import 'package:first_app/cart.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _cardList = ['A', "10", "J", "K"];
  Timer? _timerController;
  List<String> _showedCardList = [];
  int _timer = 1000;

  @override
  void initState() {
    super.initState();
    _cardList.shuffle();
    _timerController = Timer.periodic(Duration(milliseconds: 10), (timer) {
      if (_timer > 0)
        setState(() {
          _timer = _timer - 1;
        });
    });
  }

  void onClickCard(String title) {
    if (title == "A") {
      _timerController?.cancel();
    }
    setState(() {
      _showedCardList.add(title);
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(children: [
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: height * _timer / 1000,
          color: Colors.amberAccent,
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Хугацаа: $_timer",
            style: TextStyle(fontSize: 24),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyCard(
                _cardList[0],
                onTap: onClickCard,
                active: _showedCardList.contains(_cardList[0]),
              ),
              SizedBox(
                width: 50,
              ),
              MyCard(
                _cardList[1],
                onTap: onClickCard,
                active: _showedCardList.contains(_cardList[1]),
              )
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyCard(
                _cardList[2],
                onTap: onClickCard,
                active: _showedCardList.contains(_cardList[2]),
              ),
              SizedBox(
                width: 50,
              ),
              MyCard(
                _cardList[3],
                onTap: onClickCard,
                active: _showedCardList.contains(_cardList[3]),
              )
            ],
          )
        ],
      )
    ]));
  }
}

// Component

// class MyText extends StatelessWidget {
//   String title;

//   MyText(this.title);
//   @override
//   Widget build(BuildContext context) {
//     return Text(title);
//   }
// }

// Stateless Widget

// class HomePage extends StatelessWidget {
//   String title = "Initial";

//   void setTitle() {
//     title = "hi";
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(title),
//           ElevatedButton(
//             onPressed: () => setTitle(),
//             child: Text("To Change"),
//           ),
//         ],
//       ),
//     );
//   }
// }
