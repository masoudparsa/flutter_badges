// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:badges/badges.dart' as badges;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Badges'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int mailCount = 0;
  bool likedMessage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarBrightness: Brightness.light),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  addBadgeCount(widget: Icon(Icons.person), badgeCount: 5),
                ],
              ),
              SizedBox(
                height: 64,
              ),
              Row(
                children: [
                  addBadgeCount(
                      widget: SizedBox(
                        width: 150,
                        height: 50,
                        child: ElevatedButton(
                            onPressed: () {}, child: Text("Test Badge")),
                      ),
                      badgeCount: 25,
                      badgeColor: Colors.red)
                ],
              ),
              SizedBox(
                height: 64,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          mailCount += 1;
                        });
                      },
                      icon: addBadgeCount(
                          widget: Icon(Icons.mail),
                          badgeCount: mailCount,
                          badgeColor: Colors.blue,
                          badgeShape: badges.BadgeShape.instagram))
                ],
              ),
              SizedBox(
                height: 64,
              ),
              Row(
                children: [
                  Flexible(
                      child: addBadgeIcon(
                          widget: Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              "Hello my name is James.I Like Flutter",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          badgeIcon: likedMessage == true
                              ? Icon(
                                  Icons.thumb_up,
                                  color: Colors.white,
                                )
                              : null)),
                  SizedBox(
                    width: 16,
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          likedMessage = false;
                        });
                      },
                      icon: Icon(Icons.thumb_down)),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          likedMessage = true;
                        });
                      },
                      icon: Icon(Icons.thumb_up))
                ],
              )
            ],
          ),
        ));
  }

  Widget addBadgeCount(
      {required Widget widget,
      required int badgeCount,
      Color badgeColor = Colors.green,
      badges.BadgeShape badgeShape = badges.BadgeShape.circle}) {
    return badges.Badge(
      showBadge: badgeCount != 0,
      badgeContent: Text(
        badgeCount.toString(),
        style: TextStyle(color: Colors.white),
      ),
      badgeStyle: badges.BadgeStyle(badgeColor: badgeColor, shape: badgeShape),
      child: widget,
    );
  }

  Widget addBadgeIcon(
      {required Widget widget,
      required Icon? badgeIcon,
      Color badgeColor = Colors.green,
      badges.BadgeShape badgeShape = badges.BadgeShape.circle}) {
    return badges.Badge(
      showBadge: badgeIcon != null,
      position: badges.BadgePosition.bottomStart(bottom: -20, start: -12),
      badgeContent: badgeIcon,
      badgeStyle: badges.BadgeStyle(badgeColor: badgeColor, shape: badgeShape),
      child: widget,
    );
  }
}
