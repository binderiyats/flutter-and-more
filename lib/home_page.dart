import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = "Off";

  void onSubmit(String value) {
    setState(() {
      title = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Row(
      mainAxisSize: MainAxisSize.max,
      // crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("First text"),
        Text("Second text"),
        Text("Third text"),
      ],
    )));
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
