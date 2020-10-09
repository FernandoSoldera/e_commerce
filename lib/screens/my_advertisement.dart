import 'package:e_commerce/components/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class MyAdvertisement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 5.0,
            labelPadding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            tabs: [
              TabItem(title: 'purchases'.tr().toString()),
              TabItem(title: 'sales'.tr().toString()),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Text('Primeira aba'),
            Text('Segunda aba'),
          ],
        ),
      ),
    );
  }
}
