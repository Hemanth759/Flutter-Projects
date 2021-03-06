import 'package:flutter/material.dart';

import 'package:real_time_messaging/pages/home/homePage.dart';
import 'package:real_time_messaging/pages/login/login.dart';
import 'package:real_time_messaging/pages/editProfile/editprofile.dart';
import 'package:real_time_messaging/pages/chats/chat.dart';
import 'package:real_time_messaging/pages/notFoundPage.dart';

import 'package:real_time_messaging/models/user.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Box',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.red[400],
        accentColor: Colors.teal,
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/home':
            final Map<String, String> currentUser = settings.arguments;
            return MaterialPageRoute(
              builder: (context) => HomePage(
                    currentUser: currentUser,
                  ),
            );
            break;
          case '/':
            return MaterialPageRoute(
              builder: (context) => LoginPage(),
            );
            break;
          case '/editProfile':
            final Map<String, String> user = settings.arguments;
            return MaterialPageRoute(
              builder: (context) => EditProfilePage(
                    currentUser: user,
                  ),
            );
            break;
          case '/chat':
            final Map<String, dynamic> args = settings.arguments;
            final Map<String, String> user = args['user'];
            final User frdUser = args['friendUser'];
            debugPrint('current user is: ${user['name']} and friend user is : ${frdUser.name}');
            return MaterialPageRoute(
              builder: (context) => ChatPage(
                    currentUserMap: user,
                    friendUser: frdUser,
                  ),
            );
        }
      },
      onUnknownRoute: (RouteSettings settings) {
        String unknownRoute = settings.name;
        debugPrint('Route of $unknownRoute not found');
        return MaterialPageRoute(
          builder: (context) => NotFoundPage(),
        );
      },
    );
  }
}
