// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:bitcoin_ticker/conversion_model.dart';
import 'package:bitcoin_ticker/list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String baseUrl =
    "https://pro-api.coinmarketcap.com/v1/tools/price-conversion";
const String apiKey = "CMC_PRO_API_KEY=47832bf5-3c0c-413c-97f5-ce1c5e591637";

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var dropItemValue;

  var currencyID = "USD";
  String btcPrice = "0";
  String etcPrice = "1";
  String ltcPrice = "2";

  Future<String> getData(String bitcoin) async {
    var url = Uri.parse(
        "$baseUrl?$apiKey&amount=1&symbol=$bitcoin&convert=$currencyID");
    var response = await http.get(url);
    var bitcoinPrice = "";
    if (response.statusCode == 200) {
      var data = response.body;
      var jsonData = jsonDecode(response.body);
      // var dataObj = CurrencyModel.fromJson(jsonData);
      double doubleBtcPrice = jsonData["data"]["quote"][currencyID]["price"];
      bitcoinPrice = doubleBtcPrice.toStringAsFixed(5);
      return bitcoinPrice;
    }
    return bitcoinPrice;
    // return CurrencyModel.fromJson(jsonDecode(response.body));
  }

  fetch() async {
    btcPrice = await getData("BTC");
    etcPrice = await getData("ETH");
    ltcPrice = await getData("LTC");
    setState(() {
      btcPrice;
      etcPrice;
      ltcPrice;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Bitcoin💰"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                ReusableCard(
                  title: "BITCOIN: $btcPrice",
                ),
                ReusableCard(
                  title: "ETHIRIUM: $etcPrice",
                ),
                ReusableCard(
                  title: "LEETCOIN: $ltcPrice",
                ),
              ],
            ),
            Container(
              height: 150,
              color: Colors.blue,
              child: Center(
                child: DropdownMenu(
                  dropdownMenuEntries: currenciesList
                      .map<DropdownMenuEntry>(
                        (value) =>
                            DropdownMenuEntry(value: value, label: value),
                      )
                      .toList(),
                  menuHeight: 200,
                  width: 200,
                  hintText: "Select Currencies",
                  on
                ),
              ),
            )
          ],
        ));
  }
}

class ReusableCard extends StatelessWidget {
  final String title;

  ReusableCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(18),
      elevation: 20,
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
        child: Text(title),
      ),
    );
  }
}
