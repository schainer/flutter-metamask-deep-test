import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeView('Metamask Tester'),
    );
  }
}

class HomeView extends StatelessWidget {
  HomeView(this.title);

  final String title;
  final String _url = 'https://metamask.app.link/dapp/www.cutemypet.com/';
  final String _pay =
      'https://metamask.app.link/send/0xB8aCe4570Ef1B3F0e66Af9d54F1621AbF87161f8@1001?value=1e18';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                _launchURL(_url);
              },
              child: Text('CuteMyPet 바로가기')),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                _launchURL(_pay);
              },
              child: Text('결제 테스트')),
          const SizedBox(
            height: 15,
          ),
        ],
      )),
    );
  }
}

void _launchURL(String url) async {
  await canLaunch(url) ? await launch(url) : throw 'Cannot Launch!';
}
