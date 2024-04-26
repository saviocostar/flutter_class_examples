import 'package:flutter/material.dart';

class ScrollbarListViewSample extends StatelessWidget {
  ScrollbarListViewSample({super.key, required this.title});

  final String title;

  final ScrollController _firstController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.lightGreen,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.onBackground,
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
        ),
        body: Scrollbar(
          thumbVisibility: true,
          controller: _firstController,
          child: ListView.builder(
              controller: _firstController,
              itemCount: 30,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Scrollable : Index $index',
                    style: const TextStyle(
                      fontSize: 20,
                      // backgroundColor: Colors.deepPurple,
                      // color: Colors.white,
                    ),
                  ),
                );
              }),
        ));
  }
}
