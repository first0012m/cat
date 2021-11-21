import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cat/admin/home.dart';
import 'package:cat/api.dart';
import 'package:cat/register.dart';
import 'package:http/http.dart' as http;
import 'package:cat/user/home.dart';
import 'dart:async';

class Loginpage extends StatefulWidget {
  Loginpage({Key? key, m_username}) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController m_username = TextEditingController();
  TextEditingController m_password = TextEditingController();

  String baseUrl = Api.log;
  String msg = "";

  login() async {
    final res = await http.post(Uri.parse(baseUrl), body: {
      "m_username": m_username.text,
      "m_password": m_password.text,
    });
    final data = jsonDecode(res.body);

    // await FlutterSession().set('token', m_username);

    print(data);

    if (data['level'] == '0') {
      showDialog(
          context: context,
          builder: (c) {
            return CupertinoAlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/load.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
              content: Text('กรุณารอสักครู่'),
            );
          });
      new Timer(const Duration(milliseconds: 3000), () {
        setState(() {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (c) => Homeuser(m_username: data['m_username'])));
        });
      });
    } else if (data['level'] == '1') {
      showDialog(
          context: context,
          builder: (c) {
            return CupertinoAlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/load.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
              content: Text('กรุณารอสักครู่'),
            );
          });
      new Timer(const Duration(milliseconds: 3000), () {
        setState(() {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (c) => Homeadmin(m_username: data['m_username'])));
        });
      });
    } else {
      showDialog(
          context: context,
          builder: (c) {
            return CupertinoAlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/close.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
              content: Text('บัญชีผู้ใช้ หรือ รหัสผ่าน ไม่ถูกต้อง'),
            );
          });
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img/1.jpeg'), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                    right: 40,
                    left: 40),
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(1),
                  child: Column(
                    children: [
                      Image.asset('assets/img/PhotoRoom.PNG'),
                      Container(
                        child: Text(
                          'ติดตามพิกัดรายบุคคล',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: m_username,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'ชื่อบัญชีผู้ใช้',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'กรุณากรอกบัญชีผู้ใช้';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: m_password,
                        obscureText: true,
                        textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'รหัสผ่าน',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'กรุณากรอกรหัสผ่าน';
                          }
                          return null;
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'ลืมรหัสผ่าน',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'เข้าสู่ระบบ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.black,
                            child: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  login();
                                }
                              },
                              icon: Icon(Icons.arrow_forward),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('หากยังไม่มีบัญชี',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Register();
                                }));
                              },
                              child: Text(
                                'สมัครสมาชิก',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
