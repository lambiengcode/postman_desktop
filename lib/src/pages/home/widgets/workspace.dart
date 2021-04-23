import 'package:flutter/material.dart';
import 'package:flutter_postman_application/src/controllers/workspace_controller.dart';
import 'package:flutter_postman_application/src/public/method.dart';
import 'package:flutter_postman_application/src/public/styles.dart';
import 'package:get/get.dart';

class WorkSpace extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WorkSpaceState();
}

class _WorkSpaceState extends State<WorkSpace> {
  final workSpaceController = Get.put(WorkSpaceController());
  String _method = 'Get';
  String _endPoint = '';
  String _body = '';
  TextEditingController _endPointController = new TextEditingController();
  TextEditingController _bodyController = new TextEditingController();
  FocusNode _focusNodeBody = new FocusNode();

  submit(endPoint, body) {
    workSpaceController.usingMethod(
      _method,
      endPoint.toString().trim(),
      body.toString().trim(),
    );
  }

  submitBody(body) {
    setState(() {
      _body = body;
      _bodyController.text = body;
    });
    _focusNodeBody.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      color: mC,
      padding: EdgeInsets.only(left: 24.0),
      child: Column(
        children: [
          SizedBox(height: _size.height / 30.0),
          _buildInputMethod(),
          SizedBox(height: _size.height / 60.0),
          _buildInputBody(context),
        ],
      ),
    );
  }

  Widget _buildInputMethod() {
    return Container(
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
                  8.0,
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
                controller: _endPointController,
                onFieldSubmitted: (val) => submit(val, _body),
                cursorColor: fCL,
                cursorRadius: Radius.circular(30.0),
                style: TextStyle(
                  color: fCL,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                ),
                onChanged: (val) {
                  setState(() {
                    _endPoint = val.trim();
                  });
                },
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    top: 18.0,
                    left: 36.0,
                  ),
                  border: InputBorder.none,
                  hintText: "Type a Link...",
                  hintStyle: TextStyle(
                    color: fCL,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: Container(
                    width: 75.0,
                    margin: EdgeInsets.symmetric(horizontal: 28.0),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField(
                        icon: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: colorDarkGrey,
                          size: 12.0,
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
                                  fontSize: 14.0,
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
          GestureDetector(
            onTap: () => submit(_endPoint, _body),
            child: Container(
              width: 120.0,
              margin: EdgeInsets.symmetric(vertical: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: colorPrimary,
              ),
              alignment: Alignment.center,
              child: Text(
                'SEND',
                style: TextStyle(
                  color: mC,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(width: 20.0),
        ],
      ),
    );
  }

  Widget _buildInputBody(context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: _size.height / 3.0,
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(16.0, 12.0, .0, 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  8.0,
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
                maxLines: ((_size.height / 3.0).round() / 22.5).round(),
                focusNode: _focusNodeBody,
                controller: _bodyController,
                cursorColor: fCL,
                cursorRadius: Radius.circular(30.0),
                style: TextStyle(
                  color: fCL,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                ),
                onFieldSubmitted: (val) => submitBody(val),
                onChanged: (val) {
                  setState(() {
                    _body = val.trim();
                  });
                },
                textAlign: TextAlign.justify,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    bottom: .0,
                    left: 36.0,
                    right: 24.0,
                  ),
                  border: InputBorder.none,
                  hintText: "Type a Body (JSON)...",
                  hintStyle: TextStyle(
                    color: fCL,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 20.0),
        ],
      ),
    );
  }
}
