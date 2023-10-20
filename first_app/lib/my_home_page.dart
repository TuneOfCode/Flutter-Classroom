// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> popupMenus = ['Carts', 'About', 'Settings', 'Logout'];
  String textContent = "My Content";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: <Color>[Colors.red, Colors.blue]),
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
        ),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.only(
        //       bottomLeft: Radius.circular(25),
        //       bottomRight: Radius.circular(25)),
        //   side: BorderSide(color: Colors.white, width: 2),
        // ),
        // leading: Icon(
        //   Icons.home,
        //   color: Colors.white,
        //   size: 40,
        // ),
        title: const Text(
          'Nhóm 2',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (_) =>
                popupMenus.map((e) => PopupMenuItem(child: Text(e))).toList(),
          ),
          // IconButton(
          //   onPressed: () => {},
          //   icon: const Icon(
          //     Icons.add,
          //     color: Colors.white,
          //     size: 40,
          //   ),
          // ),
          // IconButton(
          //   onPressed: () => {},
          //   icon: const Icon(
          //     Icons.search,
          //     color: Colors.white,
          //     size: 40,
          //   ),
          // ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ignore: prefer_const_constructors
          Text(
            'My Home Page',
            // ignore: prefer_const_constructors
            style: TextStyle(
                color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Text(
            textContent,
            // ignore: prefer_const_constructors
            style: TextStyle(
                color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
            key: const Key('my_text_content'),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.grey,
                gradient: LinearGradient(colors: [Colors.red, Colors.blue]),
                borderRadius: BorderRadius.circular(50)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    // ignore: prefer_const_constructors
                    icon: Icon(Icons.home, color: Colors.white, size: 40),
                    onPressed: () {
                      var snackBar =
                          // ignore: prefer_const_constructors
                          SnackBar(content: Text('Bạn đã nhấn vào nút Home'));
                      setState(() {
                        textContent = 'Home';
                      });
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }),
                IconButton(
                  // ignore: prefer_const_constructors
                  icon: Icon(Icons.account_box, color: Colors.white, size: 40),
                  onPressed: () {
                    var snackBar =
                        // ignore: prefer_const_constructors
                        SnackBar(content: Text('Bạn đã nhấn vào nút Account'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
                IconButton(
                  // ignore: prefer_const_constructors
                  icon: Icon(Icons.share, color: Colors.white, size: 40),
                  onPressed: () {
                    var snackBar =
                        // ignore: prefer_const_constructors
                        SnackBar(content: Text('Bạn đã nhấn vào nút Share'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Đoạn chat'),
          BottomNavigationBarItem(icon: Icon(Icons.phone), label: 'Cuộc gọi'),
          BottomNavigationBarItem(icon: Icon(Icons.logout), label: 'Đăng xuất'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: ListView(
        scrollDirection: Axis.vertical,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
                // gradient: LinearGradient(
                //   colors: [Colors.red, Colors.blue],
                // ),
                ),
            child: Text(
              'List',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () => {
              Navigator.pop(context),
            },
            title: Text('Item 1',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
