import 'package:flutter/material.dart';
import 'package:iti_freelancing_hub/core/utils/mainscafold.dart';

class AboutItScreen extends StatelessWidget {
  static const routeName = '/about-it';

  const AboutItScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScaffold(body: Text("About IT screen"));
  }
}
