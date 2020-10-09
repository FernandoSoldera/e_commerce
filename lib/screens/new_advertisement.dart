import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class NewAdvertisement extends StatefulWidget {
  @override
  _NewAdvertisementState createState() => _NewAdvertisementState();
}

class _NewAdvertisementState extends State<NewAdvertisement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('new_advertisement'.tr().toString()),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'title'.tr().toString(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'price'.tr().toString(),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'description'.tr().toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
