// ignore_for_file: empty_catches, prefer_collection_literals

import 'dart:convert';

import 'package:flutter/material.dart';
import 'web_browser.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BaseWebview extends State<WebBrowser> {
  late WebViewController _webViewController;

  bool _canGoBack = false;

  bool loading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_canGoBack) {
          await _webViewController.goBack();
          return false; // Prevent closing the application
        }
        return true; // Allow closing the application
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Container(
                padding: const EdgeInsets.only(left: 7, right: 7),
                child: Stack(
                  children: <Widget>[
                    WebView(
                      onWebViewCreated: (WebViewController controller) {
                        _webViewController = controller;
                      },
                      onPageFinished: (a) async {
                        final canGoBack = await _webViewController.canGoBack();
                        setState(() {
                          _canGoBack = canGoBack;
                        });
                        setState(() {
                          loading = false;
                        });
                      },
                      javascriptChannels: <JavascriptChannel>[
                        JavascriptChannel(
                            name: "MitdoneApp",
                            onMessageReceived: (JavascriptMessage e) {
                              try {
                                var reponce = json.decode(e.message);

                                Navigator.of(context).pop(reponce);
                              } catch (er) {}
                            })
                      ].toSet(),
                      navigationDelegate: (n) {
                        if (n.url.contains('error')) {
                          Navigator.of(context).pop(false);
                        }
                        setState(() {
                          loading = true;
                        });
                        return NavigationDecision.navigate;
                      },
                      initialUrl: widget.url,
                      javascriptMode: JavascriptMode.unrestricted,
                    ),
                    loading
                        ? Center(
                            child: Container(
                              padding:const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              width: 50,
                              height: 50,
                              child: const CircularProgressIndicator(
                                color: Colors.amber,
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
