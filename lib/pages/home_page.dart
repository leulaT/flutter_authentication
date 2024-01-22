import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/homePage';

  final String loggedFrom;
  const HomePage({
    super.key,
    required this.loggedFrom,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.loggedFrom} user'),
        actions: [
          IconButton(
            onPressed: () {
              //logout functionality
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: Center(
        child: Text('Loged from: ${widget.loggedFrom}'),
      ),
    );
  }
}
