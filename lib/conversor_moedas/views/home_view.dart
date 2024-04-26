import 'package:camp_examples/conversor_moedas/components/currency_box.dart';
import 'package:camp_examples/conversor_moedas/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 100, left: 30, right: 30, bottom: 20),
        child: Column(children: [
          Image.asset(
            'assets/logo.png',
            width: 200,
            height: 200,
            alignment: Alignment.center,
          ),
          const SizedBox(height: 30),
          CurrencyBox(
              selectedItem: homeController.toCurrency,
              controller: toText,
              items: homeController.currencies,
              onChanged: (model) {
                setState(() {
                  homeController.toCurrency = model;
                });
              }),
          const SizedBox(height: 10),
          CurrencyBox(
              selectedItem: homeController.fromCurrency,
              controller: fromText,
              items: homeController.currencies,
              onChanged: (model) {
                setState(() {
                  homeController.fromCurrency = model;
                });
              }),
          const SizedBox(height: 50),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent),
              onPressed: () {
                homeController.convert();
              },
              child: const Text('CONVERTER'))
        ]),
      ),
    ));
  }
}
