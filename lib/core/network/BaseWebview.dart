import 'dart:convert';

import 'package:flutter/material.dart';
import 'WebBrowser.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BaseWebview extends State<WebBrowser> {
  late WebViewController _webViewController;

  bool _canGoBack = false;

  bool loading = true;

  @override
  void initState() {
    print(widget.url);
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
                        print('here_WebView_onPageFinished: $a');
                        setState(() {
                          print('here_WebView_onPageFinished #1');
                          loading = false;
                        });
                      },
                      javascriptChannels: <JavascriptChannel>[
                        JavascriptChannel(
                            name: "MitdoneApp",
                            onMessageReceived: (JavascriptMessage e) {
                              try {
                                var reponce = json.decode(e.message);
                                print(
                                    'here_WebView_onMessageReceived: $reponce');
                                Navigator.of(context).pop(reponce);
                              } catch (er) {
                                print("errrrrrrrorrrrrrrrrrrrrrrrr$er");
                                Widget okButton = TextButton(
                                  child: Text("حسناً"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                );

                                // set up the AlertDialog
                                AlertDialog alert = AlertDialog(
                                  title: Text("لزوم كار"),
                                  content: Text(er.toString()),
                                  actions: [
                                    okButton,
                                  ],
                                );

                                // show the dialog
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alert;
                                  },
                                );
                                // Alert.show(context, er.toString());
                              }
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
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color: Colors.amber,
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
                padding:const  EdgeInsets.only(left: 7, right: 7),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
