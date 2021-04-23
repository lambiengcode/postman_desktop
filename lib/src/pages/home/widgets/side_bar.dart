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
      color: mC,
      padding: EdgeInsets.only(left: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: _size.height / 30.0),
          Text(
            '.History',
            style: TextStyle(
              color: colorTitle,
              fontSize: 28.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: _size.height / 40.0),
          Container(
            height: 4.0,
            margin: EdgeInsets.only(right: 160.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              color: mCD,
              boxShadow: [
                BoxShadow(
                  color: mCD,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 2.0,
                ),
                BoxShadow(
                  color: mCL,
                  offset: Offset(-1.0, -1.0),
                  blurRadius: 1.0,
                ),
              ],
            ),
          ),
          SizedBox(height: _size.height / 60.0),
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
                          text: 'POST :  ',
                          style: TextStyle(
                            color: Colors.deepOrange.shade400,
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: 'localhost:3000/Auth/Login',
                          style: TextStyle(
                            color: colorDarkGrey,
                            fontSize: 14.0,
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
