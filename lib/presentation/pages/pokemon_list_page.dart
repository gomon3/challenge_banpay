import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:challenge_banpay/core/utils/global.dart';

import 'package:flutter/services.dart' show rootBundle;


class TwoButtonsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dos Botones')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _loadConfigFile,
              child: Text('Botón 1'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loadConfigFile,
              child: Text('Botón 2'),
            ),
          ],
        ),
      ),
    );
  }

  void _loadConfigFile() async {
    final configFile = await rootBundle.loadString('assets/${Global.env!.name}/config.json');
    final Map<String, dynamic> configData = jsonDecode(configFile);

    String label = configData['label'];

    print(label);
  }
}