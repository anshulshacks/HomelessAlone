import 'package:HomelessAlone/widgets/drawer.dart';
import 'package:flutter/material.dart';

class MoreInfo extends StatelessWidget {
  final String item;
  final String address;

  MoreInfo(this.item, this.address);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerSection(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(children: [
        SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                '$item',
                style: TextStyle(
                  fontFamily: 'Source Sans',
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Please deliver to $address', style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
      ],),
    );
  }
}