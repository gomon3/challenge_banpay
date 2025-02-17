import 'package:flutter/material.dart';
import 'package:challenge_banpay/core/utils/global.dart';
import 'package:challenge_banpay/presentation/pages/pokemon_list_page.dart';

void main() {
  Global.env = Env.dev;
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: TwoButtonsView(),
  ));
}
