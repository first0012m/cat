import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cat/api.dart';
import 'package:cat/login.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController m_username = TextEditingController();
  TextEditingController pass1 = TextEditingController();
  TextEditingController pass2 = TextEditingController();
  TextEditingController m_name = TextEditingController();
  TextEditingController m_lastname = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String baseUrl = Api.regis;
  String msg = "";

  regis() async {
    final res = await http.post(Uri.parse(baseUrl), body: {
      "m_username": m_username.text,
      "pass1": pass1.text,
      "pass2": pass2.text,
      "m_name": m_name.text,
      "m_lastname": m_lastname.text,
    });

    final data = jsonDecode(res.body);
    m_username.clear();
    pass1.clear();
    pass2.clear();
    m_name.clear();
    m_lastname.clear();

    if (data['status'] == 1) {
      print(data['msg']);
      showDialog(
          context: context,
          builder: (c) {
            return CupertinoAlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/true.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
              content: Text(data['msg']),
            );
          });
      new Timer(const Duration(milliseconds: 3000), () {
        setState(() {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (c) => Loginpage(m_username: data['m_username'])));
        });
      });
    } else if (data['status'] == 2) {
      print(data['msg']);
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
              content: Text(data['msg']),
            );
          });
    } else if (data['status'] == 3) {
      print(data['msg']);
      showDialog(
          context: context,
          builder: (c) {
            return CupertinoAlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/error.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
              content: Text(data['msg']),
            );
          });
    } else {
      print(data['msg']);
      showDialog(
          context: context,
          builder: (c) {
            return CupertinoAlertDialog(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/img/error.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
              content: Text(data['msg']),
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
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img/1.jpeg'), fit: BoxFit.cover)),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
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
                      Container(
                        child: Text(
                          'สมัครสมาชิก',
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
                            hintText: 'บัญชีผู้ใช้',
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
                        controller: pass1,
                        obscureText: true,
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
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: pass2,
                        obscureText: true,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'ยืนยันรหัสผ่าน',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'กรุณากรอกยืนยันรหัสผ่าน';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: m_name,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'ชื่อ',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'กรุณากรอกชื่อผู้ใช้';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: m_lastname,
                        decoration: InputDecoration(
                            fillColor: Colors.grey.shade100,
                            filled: true,
                            hintText: 'นามสกุล',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'กรุณากรอกนามสกุล';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'ยืนยัน',
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
                                  regis();
                                }
                              },
                              icon: Icon(Icons.arrow_forward),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('หากมีบัญชีอยู่แล้ว',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 20)),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Loginpage();
                                }));
                              },
                              child: Text(
                                'ลงชื่อเข้าใช้',
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
