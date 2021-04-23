import 'package:flutter/material.dart';
import 'package:flutter_postman_application/src/pages/home/widgets/side_bar.dart';
import 'package:flutter_postman_application/src/pages/home/widgets/workspace.dart';
import 'package:flutter_postman_application/src/public/styles.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: SideBar(),
            ),
            VerticalDivider(
              color: colorDarkGrey,
              width: .2,
              thickness: .2,
            ),
            Expanded(
              flex: 8,
              child: WorkSpace(),
            ),
          ],
        ),
      ),
    );
  }
}
