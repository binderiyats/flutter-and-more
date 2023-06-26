import 'package:first_app/login_page.dart';
import 'package:first_app/routes.dart';
import 'package:first_app/tile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = false;
  void onLoginPage() {
    Navigator.pushNamed(
      context,
      RouteNames.loginPage.route,
    );
  }

  void onSubmit() {
    setState(() {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("This is snack bar"),
        action: SnackBarAction(
          label: "Close",
          onPressed: () => ScaffoldMessenger.of(context).clearSnackBars(),
        ),
      ));
    });
  }

  void onTapTile(String title) {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => TilePage(title)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Center(
        child: ListView.builder(
          itemBuilder: ((context, index) => ListTile(
                title: Text("$index"),
                leading: Icon(Icons.face),
                trailing: Icon(Icons.chevron_right),
                onTap: () => onTapTile("$index"),
                style: ListTileStyle.list,
              )),
        ),
      ),
    );
  }
}


// Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           IconButton(
//               onPressed: onSubmit,
//               icon: Icon(Icons.facebook, color: Colors.blueAccent, size: 40)),
//           ElevatedButton(
//               onPressed: () => onLoginPage(), child: Text("go to Login page")),
//           Text("Home Page"),
//           if (loading) CircularProgressIndicator()
//         ]),