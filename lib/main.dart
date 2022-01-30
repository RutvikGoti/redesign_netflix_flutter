import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/bottom_bar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays:[]);

  runApp(const NetflixRedesign());
}

class NetflixRedesign extends StatelessWidget {
  const NetflixRedesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix Redesign',
      home: BottomBar(),
    );
  }
}
