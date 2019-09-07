import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Event_Track"),
        ),
        body: Container(
          child: Center(
            child: isLoggedIn
                ? Text("Logged in as: ${prof}")
                : RaisedButton(
              child: Text("Login with Facebook"),
              onPressed: () => initiateFacebookLogin(),
            ),
          ),
        ),
      ),
    );
  }

  bool isLoggedIn = false;
  var prof = "";




  void onLoginStatusChanged(bool isLoggedIn, {profileData}) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
    });
  }

  void initiateFacebookLogin() async {
    var facebookLogin = FacebookLogin();
    var facebookLoginResult =
    await facebookLogin.logInWithReadPermissions(['email']);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");

        var graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/search?type=place&q=*&center=10.4434041%2C-61.419835&distance=1000&fields=name,id&access_token=${facebookLoginResult
                .accessToken.token}');

        var profile = json.decode(graphResponse.body);
        prof = profile.toString();

        print(profile.toString());

        onLoginStatusChanged(true, profileData: profile);
        break;
    }
  }
}


















