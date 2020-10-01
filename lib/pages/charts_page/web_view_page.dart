import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.83,
      child: WebView(
        key: _key,
        initialUrl: "https://blog.mindorks.com",
        javascriptMode: JavascriptMode.unrestricted,
        debuggingEnabled: true,
        onWebViewCreated: (WebViewController webViewController){
          _controller.complete(webViewController);
        },
      ),
    );
  }
}
