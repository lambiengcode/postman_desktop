import 'package:flutter/material.dart';
import 'package:flutter_postman_application/src/public/styles.dart';

class SideBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: _size.height / 30.0),
          Text(
            '.History',
            style: TextStyle(
              color: colorTitle,
              fontSize: _size.width / 75.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: _size.height / 20.0),
          Expanded(
            child: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Post: ',
                          style: TextStyle(
                            color: Colors.deepOrange.shade600,
                            fontSize: _size.width / 120.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'localhost:3000/Auth/Login',
                          style: TextStyle(
                            color: colorDarkGrey,
                            fontSize: _size.width / 120.0,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
