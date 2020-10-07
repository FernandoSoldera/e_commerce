import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('language'.tr().toString()),
            Row(
              children: [
                Text('EN_US'),
                Switch(
                  activeColor: Color.fromARGB(255, 153, 51, 255),
                  value:
                      EasyLocalization.of(context).locale.toString() == 'pt_BR'
                          ? true
                          : false,
                  onChanged: (value) => {
                    print(EasyLocalization.of(context).locale),
                    if (value)
                      {EasyLocalization.of(context).locale = Locale('pt', 'BR')}
                    else
                      {EasyLocalization.of(context).locale = Locale('en', 'US')}
                  },
                ),
                Text('PT_BR')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
