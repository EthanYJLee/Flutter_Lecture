import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Naver extends StatefulWidget {
  const Naver({super.key});

  @override
  State<Naver> createState() => _NaverState();
}

class _NaverState extends State<Naver> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late bool isLoading; // for indicator
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://www.naver.com',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            onPageFinished: (url) {
              setState(() {
                isLoading = false;
              });
            },
            onPageStarted: (url) {
              setState(() {
                isLoading = true;
              });
            },
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
    );
  }
}
