import 'package:flutter/material.dart';
import 'package:flutter_postman_application/src/public/method.dart';
import 'package:flutter_postman_application/src/public/styles.dart';
import 'package:flutter_icons/flutter_icons.dart';

class WorkSpace extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WorkSpaceState();
}

class _WorkSpaceState extends State<WorkSpace> {
  String _method = 'Get';
  String _api = '';
  TextEditingController _msgController = new TextEditingController();
  FocusNode _focusNode = new FocusNode();

  submitMsg(api) {}

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          SizedBox(height: _size.height / 30.0),
          Container(
            height: 75.0,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        30.0,
                      ),
                      color: mC,
                      boxShadow: [
                        BoxShadow(
                          color: mCD,
                          offset: Offset(2, 2),
                          blurRadius: 2,
                        ),
                        BoxShadow(
                          color: mCL,
                          offset: Offset(-2, -2),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: TextFormField(
                      autofocus: true,
                      focusNode: _focusNode,
                      controller: _msgController,
                      onFieldSubmitted: (val) => submitMsg(val),
                      cursorColor: fCL,
                      cursorRadius: Radius.circular(30.0),
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                        color: fCL,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                      onChanged: (val) {
                        setState(() {
                          _api = val.trim();
                        });
                      },
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                          bottom: .0,
                          left: 36.0,
                        ),
                        border: InputBorder.none,
                        hintText: "Type a Link...",
                        hintStyle: TextStyle(
                          color: fCL,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                        ),
                        prefix: Container(
                          width: 75.0,
                          margin: EdgeInsets.only(right: 24.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButtonFormField(
                              icon: Icon(
                                Icons.keyboard_arrow_down_sharp,
                                color: colorDarkGrey,
                                size: _size.width / 120.0,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              value: _method,
                              items: methods.map((m) {
                                return DropdownMenuItem(
                                    value: m,
                                    child: Text(
                                      m,
                                      style: TextStyle(
                                        fontSize: _size.width / 120.0,
                                        color: colorTitle,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ));
                              }).toList(),
                              onChanged: (val) {
                                setState(() {
                                  _method = val;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => submitMsg(_api),
                  icon: Icon(
                    Feather.send,
                    color: _api.length == 0 ? fCD : colorPrimary,
                    size: 30.0,
                  ),
                ),
                SizedBox(width: 20.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
