
import 'dart:html';

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black12,
        leading: MaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        title: Text('Login page'),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(child: Text('item')),
              PopupMenuItem(child: Text('item')),
              PopupMenuItem(child: Text('item')),
              PopupMenuItem(child: Text('item')),
            ],
            icon: Icon(
              Icons.arrow_drop_down_circle_outlined,
              size: 30,
            ),
          )
        ],
      ),
      body: Container(
        color: Colors.black12,
        child: Column(
          children: [
            Expanded(
                child: Container(
                  color: Color.fromARGB(255, 20, 144, 239),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              radius: 40,
                              child: Icon(
                                Icons.person,
                                size: 50,
                              )),
                              SizedBox(height: 10,),
                              Text('Login', style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                        ],
                      ),
                    ),
                )
              ),
            SizedBox(
              height: 15,
            ),
            Expanded(
                child: Container(
                  // color: Colors.black12,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Email',
                              suffixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'password',
                              suffixIcon: Icon(Icons.remove_red_eye_outlined),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                            ),
                          ),
                          SizedBox(height: 20,),
                          CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 34, 122, 216),
                                radius: 30,
                                child: IconButton(
                                  onPressed: (){}, 
                                   icon: Icon(Icons.arrow_forward,size: 30,color: Colors.white,),
                                ),
                           ),
                        ],
                      ),
                    ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
