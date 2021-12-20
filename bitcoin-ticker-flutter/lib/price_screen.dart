import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  CoinData coinData = CoinData();
  String dropdownValue = 'AUD';
  String displayedBTCRate = '?';
  String displayedETHRate = '?';
  String displayedLTCRate = '?';

  void updateUI(String quote) async {
    String btcRate = await coinData.getRate('BTC', quote);
    String ethRate = await coinData.getRate('ETH', quote);
    String ltcRate = await coinData.getRate('LTC', quote);
    setState(() {
      dropdownValue = quote;
      displayedBTCRate = btcRate;
      displayedETHRate = ethRate;
      displayedLTCRate = ltcRate;
    });
  }

  DropdownButton androidDropdown(){
    return DropdownButton(
       value: dropdownValue,
       onChanged: (value) {
         updateUI(value);
       },
       items: currenciesList.map((String currency){
         return DropdownMenuItem(child: Text(currency),value:currency);
       }).toList(),
     );
  }

  CupertinoPicker iosDropdown(){
    return CupertinoPicker(
      children: currenciesList.map((String currency){
        return Text(currency);
      }).toList(),
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        updateUI(currenciesList[selectedIndex]);
        },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(dropdownValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          InfoCard(displayedRate: displayedBTCRate, dropdownValue: dropdownValue,displayedCoin: 'BTC',),
          InfoCard(displayedRate: displayedETHRate, dropdownValue: dropdownValue,displayedCoin: 'ETH',),
          InfoCard(displayedRate: displayedLTCRate, dropdownValue: dropdownValue,displayedCoin: 'LTC',),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? androidDropdown() : iosDropdown(),
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key key,
    @required this.displayedRate,
    @required this.dropdownValue,
    @required this.displayedCoin,
  }) : super(key: key);

  final String displayedRate;
  final String dropdownValue;
  final String displayedCoin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $displayedCoin = $displayedRate $dropdownValue',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
