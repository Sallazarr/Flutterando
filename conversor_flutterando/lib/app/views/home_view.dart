import 'package:conversor_flutterando/app/components/currency_box.dart';
import 'package:conversor_flutterando/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController fromText = TextEditingController();

  final TextEditingController toText = TextEditingController();
  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(fromText: fromText, toText: toText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.only(top: 100, bottom: 20, left: 30, right: 30),
          child: Column(
            children: [
              Image.asset('assets/logo.png', width: 150, height: 150),
              SizedBox(height: 50),
              CurrencyBox(
                selecteditem: homeController.fromCurrency,
                controller: fromText,
                items: homeController.currencies,
                onChanged: (model) {
                  setState(() {
                    homeController.fromCurrency = model!;
                  });
                },
              ),
              SizedBox(height: 10),
              CurrencyBox(
                selecteditem: homeController.toCurrency,
                controller: toText,
                items: homeController.currencies,
                onChanged: (model) {
                  setState(() {
                    homeController.toCurrency = model!;
                  });
                },
              ),
              SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: () {
                  homeController.convert();
                },
                child: Text('CONVERTER'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
