import 'package:flutter/material.dart';
import 'BaseWebview.dart';

class WebBrowser extends StatefulWidget {
  final String? url, title;
  WebBrowser(this.url, this.title);
  @override
  State<WebBrowser> createState() {
    return BaseWebview();
  }
}
