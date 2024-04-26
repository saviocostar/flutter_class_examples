import 'package:camp_examples/exemplos_aula/scrollbar_list_view_sample.dart';
import 'package:flutter/material.dart';

class WidgetsSamples extends StatelessWidget {
  const WidgetsSamples({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FlutterLogo(
            size: 100.0,
          ),
          // const SizedBox(height: 10),

          const Center(
            child: SizedBox(
              width: 250,
              child: TextField(
                style: TextStyle(backgroundColor: Colors.pink),
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            // child: TextField(),
          ),
          Center(
            child: ElevatedButton(
              child: const Text('Tela de ListView'),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ScrollbarListViewSample(title: title),
                ),
              ),
            ),
          ),
          // const SizedBox(height: 10),

          const Opacity(
            opacity: 0.5,
            child: Image(
              image: NetworkImage(
                scale: 3,
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
              ),
            ),
          ),

          Container(
            color: Colors.grey,
            height: 150.0,
            width: 300.0,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Container(
              color: Colors.blue,
              // height: 150.0,
              // width: 300.0,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Item 3",
                  style: TextStyle(
                    fontSize: 30,
                    backgroundColor: Colors.deepPurple,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          // const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
            child: Container(
              color: Colors.yellow,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Item Grande",
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    "Item 4",
                    style: TextStyle(fontSize: 30),
                  ),
                ],
              ),
            ),
          ),
          // const Spacer(),
          const Text(
            "Item Final",
            style: TextStyle(
              fontSize: 50,
              backgroundColor: Colors.red,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
